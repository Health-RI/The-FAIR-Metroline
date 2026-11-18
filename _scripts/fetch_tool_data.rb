# frozen_string_literal: true

# Fetches the registry data for the tool pages (bio.tools, GitHub, OpenAlex) and writes
# _data/tools_fetched.json, which the site build reads instead of going online.
#
# Run from the repository root:  bundle exec ruby _scripts/fetch_tool_data.rb
# (in the Docker image: docker run --rm -e GITHUB_TOKEN -v "$PWD":/site fair-metroline bundle exec ruby _scripts/fetch_tool_data.rb)
# Weekly in CI: .github/workflows/refresh-tool-data.yml opens a pull request when the data changed.
#
# A source that does not answer keeps its previous values. An entry whose data did not change keeps its
# date, so a refresh without news leaves the file as it was.
require 'jekyll'
require 'json'
require 'yaml'
require_relative '../_plugins/tool_enrichment'

ROOT = File.expand_path('..', __dir__)
TOOLS = File.join(ROOT, '_data/tools_v2.yml')
OUT = File.join(ROOT, "_data/#{Jekyll::ToolEnrichment::DATA_FILE}.json")

def sorted(x)
  case x
  when Hash then x.keys.sort.to_h { |k| [k, sorted(x[k])] }
  when Array then x.map { |v| sorted(v) }
  else x
  end
end

# The id sets a tool page fetches with (as in build_view in _plugins/tool_page_generator.rb)
id_sets = {}
YAML.safe_load_file(TOOLS).each do |entry|
  vids = entry['ids'] || {}
  all_ids = ((entry['pending'] || {})['ids'] || {}).merge(vids)
  [vids, all_ids].each do |ids|
    k = Jekyll::ToolEnrichment.key(ids)
    id_sets[k] ||= ids unless k.empty?
  end
end

previous = File.exist?(OUT) ? JSON.parse(File.read(OUT)) : {}
out = {}
problems = []
id_sets.sort.each do |k, ids|
  prev = previous[k]
  data, failed = Jekyll::ToolEnrichment.fetch(ids, prev)
  data['fetched_at'] = prev['fetched_at'] if prev && data.except('fetched_at') == prev.except('fetched_at')
  out[k] = data unless data.empty?
  problems << "#{k}: #{failed.join(', ')} did not answer" unless failed.empty?
end

File.write(OUT, "#{JSON.pretty_generate(sorted(out))}\n")
changed = out.count { |k, v| previous[k] != v }
puts "#{out.size} id sets written to #{OUT.sub("#{ROOT}/", '')}; #{changed} changed, #{(previous.keys - out.keys).size} dropped"
puts problems.map { |x| "  #{x}" } unless problems.empty?
