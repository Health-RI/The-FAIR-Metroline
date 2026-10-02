# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'
require 'yaml'
require 'fileutils'

module Jekyll
  # Build-time enrichment of tool entries from bio.tools and GitHub.
  # Results are cached in .jekyll-cache/tools_enriched.json for CACHE_TTL seconds so
  # live-reload rebuilds don't hit the APIs. Failures are logged and ignored.
  module ToolEnrichment
    CACHE_TTL = 24 * 3600

    module_function

    def enrich(site, entry)
      ids = entry['identifiers'] || {}
      key = [ids['biotools'], ids['github']].compact.join('|')
      return {} if key.empty?

      cache = load_cache(site)
      hit = cache[key]
      return hit['data'] if hit && Time.now.to_i - hit['at'] < CACHE_TTL

      data = {}
      data.merge!(from_biotools(ids['biotools'])) if ids['biotools']
      if ids['github']
        gh = from_github(ids['github'])
        data = merge_missing(data, gh)
        data['how_to_cite'] = gh['how_to_cite'] if gh['how_to_cite'] # CITATION.cff is the authors' own choice
      end
      data['fetched_at'] = Time.now.utc.strftime('%Y-%m-%d')

      cache[key] = { 'at' => Time.now.to_i, 'data' => data }
      save_cache(site, cache)
      data
    end

    def from_biotools(id)
      d = get_json("https://bio.tools/api/#{id}?format=json")
      return {} unless d && d['biotoolsID']

      links = Array(d['link'])
      docs = Array(d['documentation'])
      pubs = Array(d['publication'])
      primary = pubs.find { |p| Array(p['type']).include?('Primary') } || pubs.first

      {
        'name' => d['name'],
        'homepage' => d['homepage'],
        'license' => d['license'],
        'languages' => d['language'],
        'platforms' => d['operatingSystem'],
        'maturity' => d['maturity'],
        'cost' => d['cost'],
        'repository' => links.find { |l| Array(l['type']).include?('Repository') }&.dig('url'),
        'issue_tracker' => links.find { |l| Array(l['type']).include?('Issue tracker') }&.dig('url'),
        'how_to_use' => docs.reject { |x| Array(x['type']).include?('Citation instructions') }
                            .map { |x| { 'url' => x['url'], 'label' => Array(x['type']).join(', ') } },
        'download' => Array(d['download']).map { |x| { 'url' => x['url'], 'label' => x['type'] } },
        'citation_count' => pubs.sum { |p| p.dig('metadata', 'citationCount').to_i },
        'how_to_cite' => primary && format_publication(primary),
        'primary_doi' => primary && primary['doi']
      }.reject { |_, v| v.nil? || v == [] || v == '' }
    end

    def from_github(repo)
      d = get_json("https://api.github.com/repos/#{repo}")
      return {} unless d && d['full_name']

      release = get_json("https://api.github.com/repos/#{repo}/releases/latest")
      out = {
        'repository' => d['html_url'],
        'issue_tracker' => d['has_issues'] ? "#{d['html_url']}/issues" : nil,
        'github_stars' => d['stargazers_count'],
        'last_commit' => d['pushed_at']&.slice(0, 10),
        'latest_release' => release && release['tag_name'],
        'latest_release_date' => release && release['published_at']&.slice(0, 10),
        'languages' => [d['language']].compact,
        'license' => d.dig('license', 'spdx_id').then { |l| l == 'NOASSERTION' ? nil : l }
      }
      cff = get_text("https://raw.githubusercontent.com/#{repo}/HEAD/CITATION.cff")
      out['how_to_cite'] = format_cff(cff) if cff
      out.reject { |_, v| v.nil? || v == [] }
    end

    def format_publication(pub)
      m = pub['metadata'] || {}
      authors = Array(m['authors']).map { |a| a['name'] }.compact
      authors = authors.first(3) + ['et al.'] if authors.size > 3
      year = m['date']&.slice(0, 4)
      doi = pub['doi'] && "https://doi.org/#{pub['doi'].downcase}"
      [authors.join(', '), year && "(#{year})", m['title'] && "#{m['title']}.", m['journal'] && "#{m['journal']}.", doi]
        .compact.join(' ').strip
    end

    def format_cff(text)
      c = YAML.safe_load(text)
      authors = Array(c['authors']).map { |a| [a['given-names'], a['family-names']].compact.join(' ').then { |n| n.empty? ? a['name'] : n } }
      doi = c['doi'] && "https://doi.org/#{c['doi']}"
      [authors.join(', '), c['date-released'] && "(#{c['date-released'].to_s[0, 4]})", "#{c['title']}.", c['version'] && "Version #{c['version']}.", doi]
        .compact.join(' ')
    rescue StandardError
      nil
    end

    # Values from `b` only fill keys that `a` does not have yet (bio.tools wins over GitHub).
    def merge_missing(a, b)
      b.merge(a) { |_, _old, new| new }
    end

    def get_json(url)
      body = get_text(url, 'application/json')
      body && JSON.parse(body)
    rescue JSON::ParserError
      nil
    end

    def get_text(url, accept = '*/*')
      uri = URI(url)
      res = Net::HTTP.start(uri.host, uri.port, use_ssl: true, open_timeout: 5, read_timeout: 10) do |http|
        http.get(uri.request_uri, 'Accept' => accept, 'User-Agent' => 'fair-metroline-build')
      end
      res.is_a?(Net::HTTPSuccess) ? res.body : nil
    rescue StandardError => e
      Jekyll.logger.warn 'ToolEnrichment:', "#{url} failed (#{e.class})"
      nil
    end

    def cache_path(site)
      File.join(site.source, '.jekyll-cache', 'tools_enriched.json')
    end

    def load_cache(site)
      @cache ||= File.exist?(cache_path(site)) ? JSON.parse(File.read(cache_path(site))) : {}
    rescue JSON::ParserError
      @cache = {}
    end

    def save_cache(site, cache)
      FileUtils.mkdir_p(File.dirname(cache_path(site)))
      File.write(cache_path(site), JSON.pretty_generate(cache))
    end
  end
end
