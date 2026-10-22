# frozen_string_literal: true

require 'time'

module Jekyll
  # Creates a page for every tool in _data/tools_v2.yml, rendered with _layouts/tool_profile.html.
  #
  # Top-level values of an entry are verified and always shown. Values under `pending` are rendered too,
  # but marked: the page hides them unless the visitor adds ?unverified=1 to the URL.
  class ToolPageGenerator < Generator
    safe true
    priority :normal

    # Licence and cost values that mean "not known"; they are never shown
    NOT_SHOWN = ['unconfirmed', 'not applicable'].freeze

    def generate(site)
      entries = site.data['tools_v2'] || []
      return if entries.empty?

      @phase_order = (site.data['lifecycle_stages'] || []).map { |s| s['name'] }
      @local_types = (site.data['tool_types'] || []).select { |t| t['source'] == 'local' }.map { |t| t['name'] }
      @known_ids = entries.map { |e| e['id'] }
      steps = metroline_steps_by_tool(site)
      scenarios = scenarios_by_tool(site, steps)
      # Page URLs still follow the names in the old _data/tools.yml, so existing links keep working
      old_names = (site.data['tools'] || []).to_h { |t| [t['id'], t.dig('at_a_glance', 'Tool name')] }

      entries.each do |entry|
        id = entry['id']
        page = ToolPage.new(site, id, slugify(old_names[id] || entry['name'] || id))
        page.data['metroline_steps'] = steps[id] || []
        page.data['scenarios'] = scenarios[id] || []
        fill(site, page, entry)
        site.pages << page
      end
    end

    private

    def fill(site, page, entry)
      d = page.data
      d['tool'] = build_view(site, entry)
      d['title'] = entry['name'] || entry['id']
      # Catalogue cards, badges and filters use verified values only
      d['description'] = entry['short_description']
      d['logo_url'] = logo_url(site, entry['logo'])
      d['phase'] = sort_phases(entry['lifecycle'])
      d['domain'] = entry['domains']
      d['institutes'] = entry['institutes']
      d.compact!
    end

    # Everything a tool page shows, with each value's pending state. A value is taken from, in order:
    # the verified entry, registry data fetched with verified ids, the pending part of the entry, and
    # registry data fetched with pending ids. Single values that end up pending are listed in
    # view['pending']; lists keep verified and pending values apart (field and field_pending).
    def build_view(site, entry)
      pend = entry['pending'] || {}
      links = entry['links'] || {}
      plinks = pend['links'] || {}
      v = { 'pending' => [] }

      # Registry ids are verified one by one: fetch with the verified ids, and with all of them
      vids = entry['ids'] || {}
      all_ids = (pend['ids'] || {}).merge(vids)
      pids = all_ids.reject { |k, _| vids.key?(k) }
      fetched_v = ToolEnrichment.enrich(site, vids)
      fetched_all = pids.empty? ? fetched_v : ToolEnrichment.enrich(site, all_ids)
      # [value, pending?] from the registries
      fetched = lambda do |key|
        next [fetched_v[key], false] unless fetched_v[key].nil?

        [fetched_all[key], !fetched_all[key].nil?]
      end
      scalar = lambda do |name, key = name, registry = [nil, false], hash: entry, phash: pend, flag: key|
        value, is_pending =
          if hash.key?(key) then [hash[key], false]
          elsif !registry[0].nil? && !registry[1] then registry
          elsif phash.key?(key) then [phash[key], true]
          else registry
          end
        value = nil if NOT_SHOWN.include?(value.to_s.downcase)
        v['pending'] << flag if is_pending && !value.nil?
        v[name] = value
      end
      list = lambda do |name, key = name|
        v[name] = Array(entry[key])
        v["#{name}_pending"] = Array(pend[key]) - v[name]
      end
      # A list the entry leaves out can come from the registries, in the same order
      list_or_registry = lambda do |name, key, registry_key|
        list.call(name, key)
        value, is_pending = fetched.call(registry_key)
        next if entry.key?(key) || value.nil? || (is_pending && pend.key?(key))

        v[name], v["#{name}_pending"] = is_pending ? [[], Array(value)] : [Array(value), []]
      end

      v['name'] = entry['name']
      scalar.call('short_description')
      scalar.call('about', 'description')
      scalar.call('logo')
      v['logo_url'] = logo_url(site, v.delete('logo'))

      list_or_registry.call('tool_types', 'tool_type', 'tool_types')
      # Local types (Registry / catalogue, Self-assessment / checklist, ...) say most about a tool: put them first
      v['tool_types'] = v['tool_types'].partition { |t| @local_types.include?(t) }.flatten
      list.call('fair')
      list.call('domains')
      list.call('keywords')
      list.call('institutes')
      list.call('related')
      %w[related related_pending].each do |k|
        unknown = v[k] - @known_ids
        Jekyll.logger.warn 'Tools:', "#{entry['id']} relates to unknown ids: #{unknown.join(', ')}" unless unknown.empty?
        v[k] &= @known_ids
      end
      v['phase'] = sort_phases(entry['lifecycle']) || []
      v['phase_pending'] = (sort_phases(pend['lifecycle']) || []) - v['phase']

      # A written licence, even "unconfirmed", means the registry licence is not used
      list_or_registry.call('license', 'license', 'license')
      %w[license license_pending].each { |k| v[k] = v[k].reject { |l| NOT_SHOWN.include?(l.to_s.downcase) } }
      scalar.call('cost')
      scalar.call('code_availability')
      scalar.call('maturity', 'maturity', fetched.call('maturity'))
      scalar.call('hosted')
      scalar.call('how_to_cite', 'how_to_cite', fetched.call('how_to_cite'))

      scalar.call('homepage', hash: links, phash: plinks, flag: 'links.homepage')
      # The verified answer decides the main button; a pending answer can replace it with ?unverified=1
      v['opens_tool'] = links['homepage_opens_tool']
      v['opens_tool_pending'] = plinks['homepage_opens_tool'] unless links.key?('homepage_opens_tool')
      scalar.call('docs', hash: links, phash: plinks, flag: 'links.docs')
      scalar.call('docs_note', hash: links, phash: plinks, flag: 'links.docs_note')
      # The note ("on the platform website") only stands in for a missing link; a verified note that a
      # pending link replaces stays on the live page
      if v['docs'] && (!v['pending'].include?('links.docs') || v['pending'].include?('links.docs_note'))
        v['docs_note'] = nil
        v['pending'].delete('links.docs_note')
      end
      scalar.call('download', hash: links, phash: plinks, flag: 'links.download')
      v['downloads'] = downloads(v.delete('download'))

      unless (v['tool_types'] + v['tool_types_pending'] - @local_types).empty?
        v['activity'], v['activity_pending'] = activity(site, entry, pend, fetched_v, fetched_all)
      end
      v['metrics'] = metrics(fetched_v, vids)
      if v['metrics'].empty?
        v['metrics'] = metrics(fetched_all, all_ids)
        v['metrics_pending'] = !v['metrics'].empty?
      end
      v['more_links'] = more_links(v, links['other'], plinks['other'], vids, pids, fetched_v, fetched_all)
      v['has_pending'] = !v['pending'].empty? || v['more_links'].any? { |l| l['pending'] } ||
                         v.any? { |k, x| k.end_with?('_pending') && (x == true || (x.is_a?(Array) && !x.empty?)) }
      v
    end

    METRICS = %w[citation_count github_stars latest_release latest_release_date last_commit].freeze

    # Adoption numbers from the registries, with where they come from
    def metrics(fetched, ids)
      m = fetched.slice(*METRICS).reject { |_, x| x.nil? || x == 0 }
      return {} if m.empty?

      source = { 'biotools' => 'bio.tools', 'github' => 'GitHub' }.filter_map { |k, name| name if ids[k] }.join(' and ')
      m.merge('source' => source, 'fetched_at' => fetched['fetched_at'])
    end

    # links.download is one URL or a list of {label, url}
    def downloads(value)
      case value
      when String then [{ 'label' => 'Download', 'url' => value }]
      when Array then value
      else []
      end
    end

    # Links that are not in the header: further documentation, source code, registries. Verified links
    # come first, so of two links to the same URL the pending one is dropped.
    def more_links(view, other, other_pending, vids, pids, fetched_v, fetched_all)
      out = []
      add = ->(kind, url, label, pend) { out << { 'kind' => kind, 'url' => url, 'label' => label, 'pending' => pend } if url }
      from_ids = lambda do |ids, pend|
        add.call('Source code', ids['github'] && "https://github.com/#{ids['github']}", "github.com/#{ids['github']}", pend)
        add.call('Registry', ids['biotools'] && "https://bio.tools/#{ids['biotools']}", 'bio.tools', pend)
        add.call('Registry', ids['rsd'] && "https://research-software-directory.org/software/#{ids['rsd']}", 'Research Software Directory', pend)
        add.call('Registry', ids['fairsharing'] && "https://doi.org/#{ids['fairsharing']}", 'FAIRsharing', pend)
        add.call('DOI', ids['doi'] && "https://doi.org/#{ids['doi']}", ids['doi'], pend)
      end
      from_registries = lambda do |fetched, pend|
        Array(fetched['how_to_use']).each { |l| add.call('Documentation', l['url'], l['label'], pend) }
        add.call('Report an issue', fetched['issue_tracker'], 'Issue tracker', pend)
        add.call('Source code', fetched['repository'], short_url(fetched['repository']), pend)
      end
      Array(other).each { |o| add.call(o['kind'], o['url'], short_url(o['url']), false) }
      from_ids.call(vids, false)
      from_registries.call(fetched_v, false)
      Array(other_pending).each { |o| add.call(o['kind'], o['url'], short_url(o['url']), true) }
      from_ids.call(pids, true)
      from_registries.call(fetched_all, true)

      # Leave out what the header already links to; a pending header link only rules out pending links
      header = [view['homepage'], view['docs'], *view['downloads'].map { |d| d['url'] }]
      header_v = [view['homepage']]
      header_v << view['docs'] unless view['pending'].include?('links.docs')
      header_v += view['downloads'].map { |d| d['url'] } unless view['pending'].include?('links.download')
      seen_v = header_v.compact.map { |u| url_key(u) }
      seen = header.compact.map { |u| url_key(u) }
      out.select do |l|
        key = url_key(l['url'])
        next false if seen_v.include?(key) || (l['pending'] && seen.include?(key))

        seen_v << key unless l['pending']
        seen << key
      end
    end

    # One-line activity signal and whether it is pending, in the usual order: a verified 'deprecated',
    # activity from verified registry ids, a pending 'deprecated', activity from pending registry ids.
    def activity(site, entry, pend, fetched_v, fetched_all)
      return [DEPRECATED, false] if entry['deprecated'] == true

      verified = activity_from(site, fetched_v)
      return [verified, false] if verified
      return [DEPRECATED, true] if pend['deprecated'] == true && !entry.key?('deprecated')

      pending = activity_from(site, fetched_all)
      [pending, !pending.nil?]
    end

    DEPRECATED = { 'status' => 'archived', 'label' => 'Deprecated: no longer maintained' }.freeze

    def activity_from(site, fetched)
      return { 'status' => 'archived', 'label' => 'Archived: no longer maintained' } if fetched['archived']
      return nil unless fetched['last_commit']

      last_change = Time.parse(fetched['last_commit'])
      release = fetched['latest_release_date'] && Time.parse(fetched['latest_release_date'])
      active = (site.time - last_change) < 365 * 24 * 3600
      when_text = release ? "last release #{release.strftime('%b %Y')}" : "last change #{last_change.strftime('%b %Y')}"
      { 'status' => active ? 'active' : 'quiet', 'label' => "#{active ? 'Active' : 'No recent activity'} · #{when_text}" }
    end

    def logo_url(site, logo)
      return nil if logo.nil? || logo.empty?
      return logo if logo.start_with?('http://', 'https://')

      "#{site.config['baseurl']}/assets/img/#{logo}"
    end

    def sort_phases(phases)
      phases && Array(phases).sort_by { |p| @phase_order.index(p) || 999 }
    end

    # URLs compared without scheme, "www." and case, so http/https and owner/repo case variants match
    def url_key(url)
      url.to_s.downcase.sub(%r{\Ahttps?://(www\.)?}, '').chomp('/')
    end

    def short_url(url)
      url.to_s.sub(%r{\Ahttps?://(www\.)?}, '').chomp('/')
    end

    def slugify(name)
      name.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/\A-|-\z/, '')
    end

    # Which Metroline step pages mention each tool through show-badges / show-tiles.
    def metroline_steps_by_tool(site)
      index = Hash.new { |h, k| h[k] = [] }
      steps_meta = (site.data['metroline_steps'] || []).to_h { |st| ["/#{st['url']}", st] }
      site.pages.each do |p|
        next unless p.path.start_with?('pages/metroline_steps/')

        p.content.scan(/show-(?:badges|tiles)\.html\s+ids="([^"]+)"/).flatten
         .flat_map { |ids| ids.split(',').map(&:strip) }.uniq.each do |id|
          meta = steps_meta[p.url] || {}
          index[id] << { 'id' => meta['id'], 'title' => p.data['title'], 'url' => p.url, 'icon' => meta['icon'] }
        end
      end
      index
    end

    # Use cases per tool: tool scenarios list tool_ids explicitly; FAIR guideline scenarios are related
    # when they pass through a Metroline step that mentions the tool.
    def scenarios_by_tool(site, steps_by_tool)
      list = site.data['scenarios_list'] || []
      meta = ->(sid) { list.find { |s| s['url'].to_s.split('/').last == sid } }
      out = Hash.new { |h, k| h[k] = [] }

      (site.data['tool-scenarios'] || {}).each do |sid, steps|
        next unless (m = meta.call(sid))

        Array(steps).flat_map { |st| Array(st['tool_ids']) }.uniq.each { |tid| out[tid] << m }
      end

      (site.data['scenarios'] || {}).each do |sid, steps|
        next unless (m = meta.call(sid))

        step_ids = Array(steps).map { |st| st['step_id'] }.compact
        steps_by_tool.each do |tid, tool_steps|
          out[tid] << m if tool_steps.any? { |ts| step_ids.include?(ts['id']) }
        end
      end
      out
    end
  end

  # A generated tool page; all content comes from ToolPageGenerator#fill
  class ToolPage < Page
    def initialize(site, tool_id, slug)
      @site = site
      @base = site.source
      @dir = 'toolassemblies/tools'
      @name = "#{slug}.html"
      process(@name)
      self.data = {
        'type' => 'tool', 'tool_id' => tool_id, 'layout' => 'tool_profile',
        'permalink' => "/#{slug}", 'sidebar' => 'main', 'toc' => false
      }
      self.content = ''
    end
  end
end
