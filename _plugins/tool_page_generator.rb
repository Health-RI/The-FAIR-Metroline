# frozen_string_literal: true

require 'time'

module Jekyll
  # Generator plugin to create individual tool pages from _data/tools.yml
  class ToolPageGenerator < Generator
    safe true
    priority :normal

    def generate(site)
      # Load the tools data
      tools_data = site.data['tools']
      return unless tools_data

      # DEMO: entries in _data/tools_v2.yml (new schema) override tools.yml and use the tool_profile layout
      v2_entries = (site.data['tools_v2'] || []).to_h { |t| [t['id'], t] }
      steps_by_tool = metroline_steps_by_tool(site)
      scenarios_by_tool = scenarios_by_tool(site, steps_by_tool)

      # For each tool, create a page
      tools_data.each do |tool|
        tool_id = tool['id']
        next unless tool_id

        # Extract tool name from at_a_glance section
        tool_name = tool.dig('at_a_glance', 'Tool name') || "Tool #{tool_id}"
        
        # Create a slug from the tool name (lowercase, replace spaces with hyphens)
        # This will be used for the filename
        slug = tool_name.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/-+/, '-').gsub(/^-|-$/, '')

        # Extract domain and phase for metadata
        domain = tool.dig('at_a_glance', 'Domains using it')
        phase = tool.dig('at_a_glance', 'Life cycle phases')
        institutes = tool['institutes']
        
        # Extract short description for card display
        short_description = tool.dig('at_a_glance', 'Short description')
        fair_support_category = tool.dig('at_a_glance', 'FAIR support category')
        
        # Extract image path from tool data - supports both local paths and URLs
        # page_img_url takes precedence if both are specified
        image_path = tool['page_img_url'] || tool['page_img']

        # Get bio.tools ID if available
        biotools_id = tool['biotools_id']

        # Create the page
        page = ToolPage.new(site, tool_id, tool_name, slug, domain, phase, institutes, image_path, short_description, biotools_id, fair_support_category)
        page.data['metroline_steps'] = steps_by_tool[tool_id] || []
        page.data['scenarios'] = scenarios_by_tool[tool_id] || []
        apply_v2(site, page, v2_entries[tool_id], tool) if v2_entries[tool_id]
        site.pages << page
      end
    end

    private

    # Which Metroline step pages mention each tool through show-badges / show-tiles.
    def metroline_steps_by_tool(site)
      index = Hash.new { |h, k| h[k] = [] }
      steps_meta = (site.data['metroline_steps'] || []).to_h { |st| ["/#{st['url']}", st] }
      site.pages.each do |p|
        next unless p.path.start_with?('pages/metroline_steps/')

        p.content.scan(/show-(?:badges|tiles)\.html\s+ids="([^"]+)"/).flatten
         .flat_map { |ids| ids.split(',').map(&:strip) }.uniq.each do |id|
          meta = steps_meta[p.url] || {}
          index[id] << { 'id' => meta['id'], 'title' => p.data['title'], 'url' => p.url,
                         'summary' => meta['summary'], 'icon' => meta['icon'] }
        end
      end
      index
    end

    # Licence values from registries that do not mean "open source"
    NOT_OPEN_LICENSES = ['Proprietary', 'Other', 'Not licensed', 'NOASSERTION'].freeze

    # Scenarios per tool: tool scenarios list tool_ids explicitly; FAIR guideline scenarios are
    # related when they pass through a Metroline step that mentions the tool.
    def scenarios_by_tool(site, steps_by_tool)
      list = site.data['scenarios_list'] || []
      meta = ->(sid) { list.find { |s| s['url'].to_s.split('/').last == sid } }
      out = Hash.new { |h, k| h[k] = [] }

      (site.data['tool-scenarios'] || {}).each do |sid, steps|
        next unless (m = meta.call(sid))

        Array(steps).flat_map { |st| Array(st['tool_ids']) }.uniq.each { |tid| out[tid] << m.merge('via' => []) }
      end

      (site.data['scenarios'] || {}).each do |sid, steps|
        next unless (m = meta.call(sid))

        step_ids = Array(steps).map { |st| st['step_id'] }.compact
        steps_by_tool.each do |tid, tool_steps|
          via = tool_steps.select { |ts| step_ids.include?(ts['id']) }.map { |ts| ts['title'] }
          out[tid] << m.merge('via' => via) unless via.empty?
        end
      end
      out
    end

    def apply_v2(site, page, entry, tool)
      e = ToolEnrichment.enrich(site, entry)
      d = page.data
      d['layout'] = 'tool_profile'
      d['toc'] = false
      d['v2'] = entry
      d['enriched'] = e
      d['title'] = entry['name'] || e['name'] || d['title']
      d['description'] = entry['short_description'] if entry['short_description']
      d['page_img'] = entry['logo'] if entry['logo']
      d['tool_types'] = Array(entry['tool_type']).empty? ? Array(e['tool_types']) : Array(entry['tool_type'])
      local_types = (site.data['tool_types'] || []).select { |t| t['source'] == 'local' }.map { |t| t['name'] }
      d['is_software'] = !d['tool_types'].empty? && (d['tool_types'] - local_types).any?
      d['fair_tags'] = Array(entry['fair'])
      d['phase'] = Array(entry['lifecycle']).sort_by { |p| LIFECYCLE_ORDER.index(p) || 999 } if entry['lifecycle']
      d['domain'] = entry['domains'] if entry['domains']
      d['institutes'] = entry['institutes'] if entry['institutes']

      license = entry['license'] || e['license']
      open_source = license && !NOT_OPEN_LICENSES.include?(license)
      d['license'] = license
      d['open_source'] = open_source
      d['cost'] = entry['cost'] || e['cost'] || (open_source ? 'Free of charge' : nil)
      d['access'] = entry['access'] || e['accessibility'] || (open_source ? 'Open access' : nil)
      d['maturity'] = entry['maturity'] || e['maturity']
      d['maintenance'] = if entry['deprecated']
                           { 'status' => 'archived', 'label' => 'Deprecated: no longer maintained' }
                         else
                           maintenance(e, site.time)
                         end
      d['links'] = collect_links(entry, e, tool)
    end

    # One list of links for the page: curated, then reused from tools.yml, then fetched. De-duplicated by URL.
    def collect_links(entry, e, tool)
      res = tool.dig('at_a_glance', 'Resource URLs') || {}
      ids = entry['ids'] || {}
      website = entry.dig('links', 'homepage') || e['homepage'] || parse_links(tool.dig('at_a_glance', 'Website')).first&.dig('url')
      links = []
      links << { 'kind' => 'Website', 'url' => website, 'label' => website.to_s.sub(%r{\Ahttps?://}, '').sub(%r{/\z}, '') } if website
      links << { 'kind' => 'Documentation', 'url' => entry.dig('links', 'docs'), 'label' => 'Documentation' } if entry.dig('links', 'docs')
      # Curated docs replace the (sometimes outdated) manual links in tools.yml
      parse_links(res['Manuals']).each { |l| links << l.merge('kind' => 'Documentation') } unless entry.dig('links', 'docs')
      Array(e['how_to_use']).each { |l| links << { 'kind' => 'Documentation', 'url' => l['url'], 'label' => l['label'] } }
      parse_links(res['Training']).each { |l| links << l.merge('kind' => 'Training') }
      parse_links(res['Scripts and workflows']).each { |l| links << l.merge('kind' => 'Templates and examples') }
      parse_links(res['Specific documentation, e.g. versioning']).each { |l| links << l.merge('kind' => 'Versions') }
      download = entry.dig('links', 'download') || Array(e['download']).first&.dig('url') || e['releases_url']
      links << { 'kind' => 'Download', 'url' => download, 'label' => download.include?('github.com') ? 'Releases on GitHub' : 'Download' } if download
      repo = ids['github'] ? "https://github.com/#{ids['github']}" : e['repository']
      links << { 'kind' => 'Source code', 'url' => repo, 'label' => repo.sub(%r{\Ahttps?://}, '').sub(%r{/\z}, '') } if repo
      links << { 'kind' => 'Report an issue', 'url' => e['issue_tracker'], 'label' => 'Issue tracker' } if e['issue_tracker']
      links << { 'kind' => 'Registry', 'url' => "https://bio.tools/#{ids['biotools']}", 'label' => 'bio.tools' } if ids['biotools']
      links << { 'kind' => 'Registry', 'url' => "https://research-software-directory.org/software/#{ids['rsd']}", 'label' => 'Research Software Directory' } if ids['rsd']
      links << { 'kind' => 'Registry', 'url' => "https://doi.org/#{ids['fairsharing']}", 'label' => 'FAIRsharing' } if ids['fairsharing']
      links << { 'kind' => 'DOI', 'url' => "https://doi.org/#{ids['doi']}", 'label' => ids['doi'] } if ids['doi']
      parse_links(res['Other']).each { |l| links << l.merge('kind' => 'Other') }

      seen = {}
      links.select { |l| l['url'] && !seen[l['url'].sub(%r{/\z}, '')] && (seen[l['url'].sub(%r{/\z}, '')] = true) }
    end

    # tools.yml stores links as "<a href='url'>label</a> - note"; items without a link are skipped.
    def parse_links(items)
      Array(items).compact.filter_map do |item|
        m = item.to_s.match(%r{<a\s+href=['"]([^'"]+)['"][^>]*>(.*?)</a>(.*)}m)
        next unless m

        { 'url' => m[1], 'label' => m[2].gsub(/<[^>]+>/, '').strip,
          'note' => m[3].sub(/\A[\s)]*[-–]\s*/, '').gsub(/<[^>]+>/, '').strip }
      end
    end

    # One-line activity signal from GitHub: archived, active (code change in the last 12 months) or quiet.
    def maintenance(e, now)
      return { 'status' => 'archived', 'label' => 'Archived: no longer maintained' } if e['archived']

      last_change = e['last_commit'] && Time.parse(e['last_commit'])
      return nil unless last_change

      release = e['latest_release_date'] && Time.parse(e['latest_release_date'])
      when_text = release ? "last release #{release.strftime('%b %Y')}" : "last change #{last_change.strftime('%b %Y')}"
      active = (now - last_change) < 365 * 24 * 3600
      { 'status' => active ? 'active' : 'quiet', 'label' => "#{active ? 'Active' : 'No recent activity'} · #{when_text}" }
    end
  end

  # Canonical RDM lifecycle phase order (planning → reuse)
  LIFECYCLE_ORDER = %w[Plan Collect Process Analyse Preserve Share Reuse].freeze

  # Represents a dynamically generated tool page
  class ToolPage < Page
    def initialize(site, tool_id, tool_name, slug, domain, phase, institutes, image_path, short_description = nil, biotools_id = nil, fair_support_category = nil)
      @site = site
      @base = site.source
      @dir = 'toolassemblies/tools'
      @name = "#{slug}.html"

      self.process(@name)
      
      # Initialize data hash
      self.data = {}
      
      # Set page data
      self.data['title'] = tool_name
      self.data['type'] = 'tool'
      self.data['tool_id'] = tool_id
      self.data['page_img'] = image_path if image_path
      self.data['description'] = short_description if short_description
      self.data['biotools_id'] = biotools_id if biotools_id
      self.data['fair_support_category'] = fair_support_category if fair_support_category
      
      # Parse domain - handle various formats
      if domain
        if domain.is_a?(String)
          self.data['domain'] = domain.split(',').map(&:strip).reject(&:empty?)
        elsif domain.is_a?(Array)
          self.data['domain'] = domain
        end
      end
      
      # Parse phase - validate against canonical lifecycle order and sort accordingly
      if phase
        phases = phase.is_a?(Array) ? phase : phase.split(',').map(&:strip).reject(&:empty?)
        unknown = phases - LIFECYCLE_ORDER
        Jekyll.logger.warn "Tool #{tool_id}:", "Unknown lifecycle phases: #{unknown.join(', ')}" unless unknown.empty?
        self.data['phase'] = phases.sort_by { |p| LIFECYCLE_ORDER.index(p) || 999 }
      end
      
      # Set institutes if provided
      if institutes
        if institutes.is_a?(Array)
          self.data['institutes'] = institutes
        end
      end
      
      self.data['layout'] = 'tool'
      self.data['permalink'] = "/#{slug}"
      self.data['sidebar'] = 'main'
      
      # Set empty content - the layout will handle everything
      self.content = ''
    end
  end
end
