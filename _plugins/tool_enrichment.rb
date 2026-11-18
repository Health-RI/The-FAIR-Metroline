# frozen_string_literal: true

require 'date'
require 'json'
require 'net/http'
require 'uri'
require 'yaml'

module Jekyll
  # Registry data for the tool pages, from bio.tools, GitHub and OpenAlex.
  #
  # The site build never goes online: it reads _data/tools_fetched.json, which _scripts/fetch_tool_data.rb
  # writes (weekly by .github/workflows/refresh-tool-data.yml, or by hand). The file is keyed by the ids
  # a tool page fetches with (see `key`), once for the verified ids and once for all ids.
  #
  # Publications: bio.tools says which papers describe a tool; the verified publication DOI from the sheet
  # is used only when bio.tools lists none. OpenAlex counts their citations, because the counts stored in
  # bio.tools are rarely refreshed. Set GITHUB_TOKEN when fetching, to lift GitHub's limit of 60 requests
  # per hour for unauthenticated clients (about three requests are needed per tool), and optionally
  # OPENALEX_API_KEY (without one, OpenAlex shares a small daily budget between everyone on the same IP).
  module ToolEnrichment
    DATA_FILE = 'tools_fetched' # _data/tools_fetched.json

    module_function

    def key(ids)
      [ids['biotools'], ids['github'], ids['doi']].compact.join('|')
    end

    # Fetched data for one tool page, from the data file (no network)
    def enrich(site, ids)
      k = key(ids)
      return {} if k.empty?

      data = (site.data[DATA_FILE] || {})[k]
      return data if data

      @warned ||= {}
      unless @warned[k]
        Jekyll.logger.warn 'ToolEnrichment:', "no fetched data for #{k}; run _scripts/fetch_tool_data.rb"
        @warned[k] = true
      end
      {}
    end

    # Fetches the registry data for one set of ids (each source answers nil when it could not be reached). Anything a fetch could not get (e.g. GitHub rate
    # limit) keeps its value, and the date, from `previous`. Returns [data, failed sources].
    def fetch(ids, previous = nil)
      data = {}
      failed = []
      if ids['biotools']
        bt = from_biotools(ids['biotools'])
        failed << 'bio.tools' unless bt
        data.merge!(bt || {})
      end
      if ids['github']
        gh = from_github(ids['github']) || (failed << 'GitHub' and {})
        data = merge_missing(data, gh)
        data['how_to_cite'] = gh['how_to_cite'] if gh['how_to_cite'] # CITATION.cff is the authors' own choice
      end
      papers = Array(data.delete('papers'))
      papers = [{ 'doi' => ids['doi'].downcase, 'origin' => 'sheet' }] if papers.empty? && ids['doi'] && !failed.include?('bio.tools')
      unless papers.empty?
        dois = papers.filter_map { |x| x['doi'] }
        works = dois.empty? ? {} : openalex_works(dois)
        failed << 'OpenAlex' if works.nil?
        # without OpenAlex, earlier counts beat the stale bio.tools ones
        data.merge!(citations(papers, works || {})) unless works.nil? && previous&.key?('papers')
      end
      data['fetched_at'] = Time.now.utc.strftime('%Y-%m-%d') unless data.empty?
      if previous
        data = previous.merge(data)
        # a paper list that is gone from bio.tools does not come back from the previous fetch
        %w[papers citation_count citation_source].each { |k| data.delete(k) } if papers.empty? && !failed.include?('bio.tools')
      end
      [data, failed]
    end

    def from_biotools(id)
      d = get_json("https://bio.tools/api/#{id}?format=json")
      return nil unless d && d['biotoolsID']

      links = Array(d['link'])
      docs = Array(d['documentation'])
      pubs = Array(d['publication'])
      primary = pubs.find { |p| Array(p['type']).include?('Primary') } || pubs.first

      {
        'tool_types' => d['toolType'],
        'license' => d['license'],
        'maturity' => d['maturity'],
        'repository' => links.find { |l| Array(l['type']).include?('Repository') }&.dig('url'),
        'issue_tracker' => links.find { |l| Array(l['type']).include?('Issue tracker') }&.dig('url'),
        'how_to_use' => docs.reject { |x| Array(x['type']).include?('Citation instructions') }
                            .map { |x| { 'url' => x['url'], 'label' => Array(x['type']).join(', ') } },
        'papers' => papers_from_biotools(pubs),
        'how_to_cite' => primary && format_publication(primary)
      }.reject { |_, v| v.nil? || v == [] || v == '' }
    end

    # bio.tools publications, primary ones first: DOI, PMID, title, journal, year and the stored count
    def papers_from_biotools(pubs)
      pubs.map do |p|
        m = p['metadata'] || {}
        { 'doi' => p['doi']&.downcase&.sub(%r{\Ahttps?://(dx\.)?doi\.org/}, ''), 'pmid' => p['pmid'], 'title' => m['title'], 'journal' => m['journal'],
          'year' => m['date']&.slice(0, 4), 'primary' => Array(p['type']).include?('Primary'),
          'count' => m['citationCount'].to_i }.reject { |_, v| v.nil? || v == '' }
      end.sort_by { |x| x['primary'] ? 0 : 1 }
    end

    # Citations, title, venue and year per DOI from OpenAlex, one request per DOI, because OpenAlex merges
    # versions (a preprint and its journal article, F1000Research versions) and answers with the merged work.
    # A DOI OpenAlex does not know is left out; nil when OpenAlex could not be reached.
    def openalex_works(dois)
      key = ENV['OPENALEX_API_KEY'].to_s
      dois.each_with_object({}) do |doi, out|
        status, body = get_response("https://api.openalex.org/works/https://doi.org/#{doi}" \
                                    "?select=id,doi,cited_by_count,title,publication_year,primary_location#{key.empty? ? '' : "&api_key=#{key}"}")
        next if status == 404
        return nil unless status == 200

        w = JSON.parse(body)
        out[doi] = { 'openalex' => w['id'], 'count' => w['cited_by_count'].to_i, 'title' => w['title'],
                     'year' => w['publication_year']&.to_s, 'journal' => w.dig('primary_location', 'source', 'display_name') }
      rescue JSON::ParserError
        return nil
      end
    end

    # Each paper with its citations (OpenAlex where it knows the paper, else the count bio.tools stored;
    # missing title, journal or year filled from OpenAlex), and the total, counting a work once when
    # bio.tools lists two versions of it. A paper from the sheet that OpenAlex does not know has no count.
    def citations(papers, works)
      seen = {}
      list = papers.map do |x|
        w = works[x['doi']]
        unless w
          next x.merge('count' => x['count'].to_i, 'source' => 'bio.tools') unless x['origin'] == 'sheet'

          next x
        end

        merged = w.reject { |k, v| v.nil? || k == 'openalex' }.merge(x.reject { |k, v| k == 'count' || v.nil? })
        merged['count'] = w['count']
        merged['source'] = 'OpenAlex'
        merged['duplicate'] = true if seen[w['openalex']]
        seen[w['openalex']] = true
        merged
      end
      total = list.reject { |x| x['duplicate'] }.sum { |x| x['count'].to_i }
      { 'papers' => list.map { |x| x.except('primary') }, 'citation_count' => total,
        'citation_source' => seen.empty? ? 'bio.tools' : 'OpenAlex' }
    end

    def from_github(repo)
      d = get_json("https://api.github.com/repos/#{repo}")
      return nil unless d && d['full_name']

      release = get_json("https://api.github.com/repos/#{repo}/releases/latest")
      out = {
        'repository' => d['html_url'],
        'issue_tracker' => d['has_issues'] ? "#{d['html_url']}/issues" : nil,
        'archived' => d['archived'],
        'github_stars' => d['stargazers_count'],
        'last_commit' => d['pushed_at']&.slice(0, 10),
        'latest_release' => release && release['tag_name'],
        'latest_release_date' => release && release['published_at']&.slice(0, 10),
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
      c = YAML.safe_load(text, permitted_classes: [Date, Time])
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
      status, body = get_response(url, accept)
      status == 200 ? body : nil
    end

    # [HTTP status, body], or [nil, nil] when the request failed
    def get_response(url, accept = 'application/json')
      uri = URI(url)
      res = Net::HTTP.start(uri.host, uri.port, use_ssl: true, open_timeout: 5, read_timeout: 10) do |http|
        headers = { 'Accept' => accept, 'User-Agent' => 'fair-metroline-build' }
        token = ENV['GITHUB_TOKEN'] || ENV['JEKYLL_GITHUB_TOKEN']   # the CI workflow sets JEKYLL_GITHUB_TOKEN
        headers['Authorization'] = "Bearer #{token}" if uri.host == 'api.github.com' && token
        http.get(uri.request_uri, headers)
      end
      [res.code.to_i, res.body]
    rescue StandardError => e
      Jekyll.logger.warn 'ToolEnrichment:', "#{url.sub(/api_key=[^&]+/, 'api_key=…')} failed (#{e.class})"
      [nil, nil]
    end
  end
end
