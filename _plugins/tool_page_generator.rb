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
        
        # Extract image path from tool data - supports both local paths and URLs
        # page_img_url takes precedence if both are specified
        image_path = tool['page_img_url'] || tool['page_img']

        # Get bio.tools ID if available
        biotools_id = tool['biotools_id']

        # Create the page
        site.pages << ToolPage.new(site, tool_id, tool_name, slug, domain, phase, institutes, image_path, short_description, biotools_id)
      end
    end
  end

  # Represents a dynamically generated tool page
  class ToolPage < Page
    def initialize(site, tool_id, tool_name, slug, domain, phase, institutes, image_path, short_description = nil, biotools_id)
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
      
      # Parse domain - handle various formats
      if domain
        if domain.is_a?(String)
          self.data['domain'] = domain.split(',').map(&:strip).reject(&:empty?)
        elsif domain.is_a?(Array)
          self.data['domain'] = domain
        end
      end
      
      # Parse phase - handle various formats
      if phase
        if phase.is_a?(String)
          self.data['phase'] = phase.split(',').map(&:strip).reject(&:empty?)
        elsif phase.is_a?(Array)
          self.data['phase'] = phase
        end
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
