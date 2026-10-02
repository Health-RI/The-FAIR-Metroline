# frozen_string_literal: true

module Jekyll
  # Generator plugin to create individual tool pages from _data/tools.yml
  class ToolPageGenerator < Generator
    safe true
    priority :normal

    def generate(site)
      # Load the tools data
      tools_data = site.data['tools']
      return unless tools_data

      # DEMO: entries in _data/tools_v2.yml (new schema) override tools.yml and use the tool_v2 layout
      v2_entries = (site.data['tools_v2'] || []).to_h { |t| [t['id'], t] }
      steps_by_tool = metroline_steps_by_tool(site)

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
        apply_v2(site, page, v2_entries[tool_id]) if v2_entries[tool_id]
        site.pages << page
      end
    end

    private

    # Which Metroline step pages mention each tool through show-badges / show-tiles.
    def metroline_steps_by_tool(site)
      index = Hash.new { |h, k| h[k] = [] }
      site.pages.each do |p|
        next unless p.path.start_with?('pages/metroline_steps/')

        p.content.scan(/show-(?:badges|tiles)\.html\s+ids="([^"]+)"/).flatten
         .flat_map { |ids| ids.split(',').map(&:strip) }.uniq.each do |id|
          index[id] << { 'title' => p.data['title'], 'url' => p.url }
        end
      end
      index
    end

    def apply_v2(site, page, entry)
      enriched = ToolEnrichment.enrich(site, entry)
      d = page.data
      d['layout'] = 'tool_v2'
      d['v2'] = entry
      d['enriched'] = enriched
      d['title'] = entry['name'] || enriched['name'] || d['title']
      d['description'] = entry['short_description'] if entry['short_description']
      d['page_img'] = entry['logo'] if entry['logo']
      d['tool_type'] = entry['tool_type']
      d['fair_support_category'] = entry.dig('fair', 'support_category')
      d['fair_letters'] = Array(entry.dig('fair', 'principles')).map { |p| p[0] }.uniq
      d['phase'] = Array(entry['lifecycle_phases']).sort_by { |p| LIFECYCLE_ORDER.index(p) || 999 } if entry['lifecycle_phases']
      d['domain'] = entry['domains'] if entry['domains']
      d['institutes'] = entry.dig('adoption', 'institutes') if entry.dig('adoption', 'institutes')
      d['metroline_steps'] = entry.dig('fair', 'metroline_steps') if entry.dig('fair', 'metroline_steps')

      license = entry.dig('licensing', 'license') || enriched['license']
      d['license'] = license
      d['open_source'] = entry.dig('licensing', 'open_source').then { |o| o.nil? ? (license && license != 'Proprietary') : o }
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
