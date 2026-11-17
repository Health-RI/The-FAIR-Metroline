# Fills in page.description for link previews (og:description) when a page has none.
# Without it the theme falls back to the raw page source, which leaks Liquid tags.
module Jekyll
  class PageDescriptionGenerator < Generator
    safe true
    priority :lowest

    MIN_WORDS = 8

    def generate(site)
      known = known_descriptions(site)

      (site.pages + site.documents).each do |page|
        next unless page.output_ext == '.html'
        next if page.url == '/'
        next if present?(page.data['description']) || present?(page.data['summary'])

        page.data['description'] =
          known[normalize(page.url)] ||
          first_paragraph(page.content.to_s) ||
          site.config['description']
      end
    end

    private

    def known_descriptions(site)
      map = {}
      (site.data['metroline_steps'] || []).each do |step|
        map[normalize(step['url'])] = step['one_liner'] if present?(step['one_liner'])
      end
      (site.data['use_cases_list'] || []).each do |use_case|
        map[normalize(use_case['url'])] = use_case['description'] if present?(use_case['description'])
      end
      map
    end

    def first_paragraph(content)
      text = content
        .gsub(/\{%-?\s*comment\s*-?%\}.*?\{%-?\s*endcomment\s*-?%\}/m, ' ')
        .gsub(/\{%.*?%\}/m, ' ')
        .gsub(/\{\{.*?\}\}/m, ' ')
        .gsub(/<!--.*?-->/m, ' ')
        .gsub(%r{<(script|style)[^>]*>.*?</\1>}mi, ' ')

      text.split(/\n\s*\n/).each do |para|
        stripped = para.lines.reject { |line| line.lstrip.start_with?('#') }.join.strip
        next if stripped.start_with?('|', '```', '---')

        plain = stripped
          .gsub(%r{<h[1-6][^>]*>.*?</h[1-6]>}mi, ' ')
          .gsub(/<[^>]+>/, ' ')
          .gsub(/!\[[^\]]*\]\([^)]*\)/, ' ')
          .gsub(/\[([^\]]*)\]\([^)]*\)/, '\1')
          .gsub(/\[([^\]]*)\]\[[^\]]*\]/, '\1')
          .gsub(/^\s*>+\s?/, '')
          .gsub(/^\s*([-*+]|\d+\.)\s+/, '')
          .gsub(/\{:[^}]*\}/, '')
          .gsub(/[*_`~]+/, '')
          .gsub(/\s+/, ' ')
          .strip

        return plain if plain.split.size >= MIN_WORDS
      end
      nil
    end

    def normalize(url)
      url.to_s.sub(%r{\A/+}, '').sub(%r{/+\z}, '').sub(/\.html\z/, '')
    end

    def present?(value)
      !value.to_s.strip.empty?
    end
  end
end
