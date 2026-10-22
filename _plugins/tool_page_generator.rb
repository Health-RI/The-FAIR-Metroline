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
        apply_v2(site, page, v2_entries[tool_id]) if v2_entries[tool_id]
        site.pages << page
      end

      # Tools added in tools_v2.yml that have no entry in the old tools.yml
      known = tools_data.map { |t| t['id'] }
      v2_entries.each do |tool_id, entry|
        next if known.include?(tool_id)

        name = entry['name'] || tool_id
        slug = name.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/-+/, '-').gsub(/^-|-$/, '')
        page = ToolPage.new(site, tool_id, name, slug, nil, nil, nil, nil)
        page.data['metroline_steps'] = steps_by_tool[tool_id] || []
        page.data['scenarios'] = scenarios_by_tool[tool_id] || []
        apply_v2(site, page, entry)
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

    # Values of a tools_v2.yml entry that a page may show. Live: verified values only (the top level).
    # Full view (preview = true): pending values too, and which fields they are.
    def visible_entry(entry, preview)
      shown = Marshal.load(Marshal.dump(entry.reject { |k, _| k == 'pending' }))
      from_pending = []
      return [shown, from_pending] unless preview

      (entry['pending'] || {}).each do |key, value|
        if key == 'links'
          shown['links'] ||= {}
          value.each do |lk, lv|
            next if shown['links'].key?(lk)

            shown['links'][lk] = lv
            from_pending << "links.#{lk}"
          end
        elsif shown[key].is_a?(Array) && value.is_a?(Array)
          shown[key] = (shown[key] + value).uniq
          from_pending << key
        elsif !shown.key?(key)
          shown[key] = value
          from_pending << key
        end
      end
      [shown, from_pending]
    end

    NOT_SHOWN = ['unconfirmed', 'not applicable'].freeze

    # Each tool page carries two views: `live` (verified values only, shown by default) and `full`
    # (verified + pending, shown with ?unverified=1). `differs` says which page blocks differ, so the
    # layout renders the full version of a block only where it adds something.
    BLOCK_KEYS = {
      'hero' => %w[logo tool_types short_description homepage homepage_opens_tool hosted],
      'tags' => %w[fair_tags phase],
      'facts' => %w[license open_source cost code_availability maturity maintenance is_software domain],
      'cite' => %w[how_to_cite homepage],
      'about' => %w[about],
      'links' => %w[links],
      'adoption' => %w[metrics institutes],
      'keywords' => %w[keywords],
      'related' => %w[related]
    }.freeze

    def apply_v2(site, page, entry)
      live_entry, = visible_entry(entry, false)
      full_entry, from_pending = visible_entry(entry, true)
      e_full = full_entry['ids'] ? ToolEnrichment.enrich(site, full_entry) : {}
      e_live = live_entry['ids'] ? ToolEnrichment.enrich(site, live_entry) : {}
      live = build_view(site, live_entry, [], e_live)
      full = build_view(site, full_entry, from_pending, e_full)

      d = page.data
      d['layout'] = 'tool_profile'
      d['toc'] = false
      d.delete('fair_support_category')   # replaced by the FAIR tags; no longer shown on cards or filters
      d['live'] = live
      d['full'] = full
      d['differs'] = BLOCK_KEYS.transform_values { |keys| keys.any? { |k| live[k] != full[k] } }
      d['has_pending'] = d['differs'].values.any?
      d['title'] = live['name'] || d['title']
      # Catalogue cards, badges and filters use verified values only
      set_or_delete(d, 'description', live['short_description'])
      set_or_delete(d, 'page_img', live['logo'])
      set_or_delete(d, 'phase', live['phase'])
      set_or_delete(d, 'domain', live['domain'])
      set_or_delete(d, 'institutes', live['institutes'])
    end

    # Everything the layout shows for one view of a tool. `pending_fields` lists the fields that came
    # from `pending`; the full view marks them with a dashed border.
    def build_view(site, shown, from_pending, e)
      v = { 'pending_fields' => from_pending, 'enriched' => e }
      v['name'] = shown['name']
      v['short_description'] = shown['short_description']
      v['logo'] = shown['logo']
      v['about'] = shown['description']
      types = Array(shown['tool_type'])
      types = Array(e['tool_types']) if types.empty?
      v['tool_types'] = types
      local_types = (site.data['tool_types'] || []).select { |t| t['source'] == 'local' }.map { |t| t['name'] }
      v['is_software'] = !types.empty? && (types - local_types).any?
      v['fair_tags'] = Array(shown['fair'])
      v['phase'] = shown['lifecycle'] && Array(shown['lifecycle']).sort_by { |p| LIFECYCLE_ORDER.index(p) || 999 }
      v['domain'] = shown['domains']
      v['institutes'] = shown['institutes']
      v['keywords'] = shown['keywords']
      v['related'] = shown['related']
      v['ids'] = shown['ids']

      licences = Array(shown['license']).reject { |l| NOT_SHOWN.include?(l.to_s.downcase) }
      licences = [e['license']] if licences.empty? && Array(shown['license']).empty? && e['license']
      v['license'] = licences.empty? ? nil : licences.join(' / ')
      v['open_source'] = if shown['code_availability']
                           shown['code_availability'] == 'Open source'
                         else
                           licences.any? { |l| !NOT_OPEN_LICENSES.include?(l) && !l.start_with?('Proprietary') }
                         end
      v['cost'] = shown['cost'] && !NOT_SHOWN.include?(shown['cost'].downcase) ? shown['cost'] : nil
      v['code_availability'] = shown['code_availability']
      v['maturity'] = shown['maturity'] || e['maturity']
      v['hosted'] = shown['hosted'] == true
      v['maintenance'] = if shown['deprecated']
                           { 'status' => 'archived', 'label' => 'Deprecated: no longer maintained' }
                         else
                           maintenance(e, site.time)
                         end
      v['homepage'] = shown.dig('links', 'homepage')
      v['homepage_opens_tool'] = shown.dig('links', 'homepage_opens_tool')
      v['how_to_cite'] = shown['how_to_cite'] || e['how_to_cite']
      v['links'] = collect_links(shown, e, from_pending)
      v['metrics'] = e.slice('citation_count', 'github_stars', 'latest_release', 'latest_release_date', 'last_commit', 'fetched_at')
      v
    end

    def set_or_delete(data, key, value)
      if value.nil? || value == [] || value == ''
        data.delete(key)
      else
        data[key] = value
      end
    end

    def short_url(url)
      url.to_s.sub(%r{\Ahttps?://(www\.)?}, '').sub(%r{/\z}, '')
    end

    # Links for the page, in a fixed order; each knows whether it is still pending (preview only).
    def collect_links(shown, e, from_pending)
      lk = shown['links'] || {}
      ids = shown['ids'] || {}
      pend = ->(field) { from_pending.include?(field) || from_pending.include?('ids') && field == 'ids' }
      links = []
      add = lambda do |kind, url, label, field, note = false|
        links << { 'kind' => kind, 'url' => url, 'label' => label, 'pending' => pend.call(field), 'note' => note } if url
      end
      home = lk['homepage']
      add.call(lk['homepage_opens_tool'] ? 'Open the tool' : 'Website', home, short_url(home), 'links.homepage')
      add.call('Documentation', lk['docs'], 'Documentation', 'links.docs')
      add.call('Documentation', home, lk['docs_note'], 'links.docs_note', true) if lk['docs_note']
      download = lk['download']
      if download.is_a?(Array)
        download.each { |dl| add.call('Download', dl['url'], dl['label'], 'links.download') }
      elsif download
        label = download.include?('github.com') ? 'On GitHub' : download.include?('pypi.org') ? 'From PyPI' : 'Download'
        add.call('Download', download, label, 'links.download')
      end
      Array(lk['other']).each { |o| add.call(o['kind'], o['url'], short_url(o['url']), 'links.other') }
      unless e.empty?   # fetched: only when the registry ids are shown
        Array(e['how_to_use']).each { |l| add.call('Documentation', l['url'], l['label'], 'ids') }
        add.call('Source code', ids['github'] ? "https://github.com/#{ids['github']}" : e['repository'],
                 ids['github'] ? "github.com/#{ids['github']}" : short_url(e['repository']), 'ids')
        add.call('Report an issue', e['issue_tracker'], 'Issue tracker', 'ids')
      end
      add.call('Registry', ids['biotools'] && "https://bio.tools/#{ids['biotools']}", 'bio.tools', 'ids')
      add.call('Registry', ids['rsd'] && "https://research-software-directory.org/software/#{ids['rsd']}", 'Research Software Directory', 'ids')
      add.call('Registry', ids['fairsharing'] && "https://doi.org/#{ids['fairsharing']}", 'FAIRsharing', 'ids')
      add.call('DOI', ids['doi'] && "https://doi.org/#{ids['doi']}", ids['doi'], 'ids')

      seen = {}
      links.select do |l|
        next true if l['note']   # "On the website" points at the homepage on purpose

        key = l['url'].sub(%r{/\z}, '')
        !seen[key] && (seen[key] = true)
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
