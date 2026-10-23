# Scenario tests for the fixes from the A review: builds tool views for synthetic entries, with
# registry data served from FAKE (no network). Run: ruby scenarios.rb
require 'yaml'
require 'json'
require 'time'
require 'date'
ROOT = "/site"
module Jekyll
  class Generator; def self.safe(*); end; def self.priority(*); end; end
  class Page; attr_accessor :data, :content; def process(*); end; end
  WARNINGS = []
  def self.logger; o = Object.new; def o.warn(*a); WARNINGS << a.join(' '); end; o; end
end
load "#{ROOT}/_plugins/tool_enrichment.rb"
load "#{ROOT}/_plugins/tool_page_generator.rb"

FAKE = {}
module Jekyll::ToolEnrichment
  class << self
    alias real_enrich enrich
    def enrich(_site, ids)
      FAKE[[ids['biotools'], ids['github']].compact.join('|')] || {}
    end
  end
end

Site = Struct.new(:source, :data, :config, :time)
data = { 'lifecycle_stages' => YAML.load_file("#{ROOT}/_data/lifecycle_stages.yml"),
         'tool_types' => YAML.load_file("#{ROOT}/_data/tool_types.yml") }
SITE = Site.new(ROOT, data, { 'baseurl' => '' }, Time.parse('2026-10-22'))
GEN = Jekyll::ToolPageGenerator.new
GEN.instance_variable_set(:@phase_order, data['lifecycle_stages'].map { |s| s['name'] })
GEN.instance_variable_set(:@local_types, data['tool_types'].select { |t| t['source'] == 'local' }.map { |t| t['name'] })
GEN.instance_variable_set(:@known_ids, %w[a b c])

def view(e) = GEN.send(:build_view, SITE, { 'id' => 'a', 'name' => 'A', 'tool_type' => ['Command-line tool'] }.merge(e))
$fails = 0
def check(name, cond)
  puts "#{cond ? 'ok  ' : 'FAIL'} #{name}"
  $fails += 1 unless cond
end

FAKE['bt'] = { 'how_to_cite' => 'Registry citation', 'maturity' => 'Mature', 'license' => 'MIT', 'citation_count' => 5, 'fetched_at' => '2026-10-22' }
FAKE['bt|o/r'] = FAKE['bt'].merge('github_stars' => 7, 'repository' => 'https://github.com/O/R', 'last_commit' => '2026-09-01')
FAKE['o/r'] = { 'github_stars' => 7, 'repository' => 'https://github.com/O/R', 'last_commit' => '2026-09-01', 'license' => 'Apache-2.0', 'fetched_at' => '2026-10-22' }

# 1 has_pending covers pending lists, the pending button and pending links
check '1 nothing pending', view('links' => { 'homepage' => 'https://a.org' })['has_pending'] == false
check '1 pending list', view('pending' => { 'keywords' => ['RDF'] })['has_pending']
check '1 pending button', view('links' => { 'homepage' => 'https://a.org' }, 'pending' => { 'links' => { 'homepage_opens_tool' => true } })['has_pending']
check '1 pending link', view('pending' => { 'links' => { 'other' => [{ 'kind' => 'Training', 'url' => 'https://t.org' }] } })['has_pending']

# 2 + 9 more links: verified copy wins, URLs compared without scheme/www/case/slash
v = view('links' => { 'homepage' => 'https://a.org', 'other' => [{ 'kind' => 'Training', 'url' => 'https://www.T.org/x/' }] },
         'pending' => { 'links' => { 'other' => [{ 'kind' => 'Training', 'url' => 'http://t.org/x' }] } })
check '2 verified copy kept', v['more_links'].map { |l| [l['url'], l['pending']] } == [['https://www.T.org/x/', false]]
v = view('links' => { 'homepage' => 'https://a.org', 'other' => [{ 'kind' => 'Documentation', 'url' => 'https://docs.a.org' }] },
         'pending' => { 'links' => { 'docs' => 'https://docs.a.org/' } })
check '2 pending docs does not drop verified link', v['more_links'].size == 1 && v['more_links'][0]['pending'] == false
v = view('links' => { 'homepage' => 'https://a.org', 'docs' => 'https://docs.a.org' },
         'pending' => { 'links' => { 'other' => [{ 'kind' => 'Documentation', 'url' => 'https://DOCS.a.org/' }] } })
check '2 pending copy of verified docs dropped', v['more_links'].empty?
v = view('ids' => { 'github' => 'o/r' }, 'links' => { 'homepage' => 'https://github.com/o/r' })
check '9 repo case/scheme duplicate of homepage dropped', v['more_links'].none? { |l| l['url'] =~ /github\.com\/o\/r/i }

# 3 order: verified > registry (verified ids) > pending > registry (pending ids)
v = view('ids' => { 'biotools' => 'bt' }, 'pending' => { 'how_to_cite' => 'Pending citation', 'maturity' => 'Emerging' })
check '3 verified registry citation beats pending', v['how_to_cite'] == 'Registry citation' && !v['pending'].include?('how_to_cite')
check '3 verified registry maturity beats pending', v['maturity'] == 'Mature' && !v['pending'].include?('maturity')
v = view('pending' => { 'ids' => { 'biotools' => 'bt' }, 'how_to_cite' => 'Pending citation' })
check '3 pending citation beats pending registry', v['how_to_cite'] == 'Pending citation' && v['pending'].include?('how_to_cite')
v = view('pending' => { 'ids' => { 'biotools' => 'bt' } })
check '3 registry citation from pending ids is pending', v['how_to_cite'] == 'Registry citation' && v['pending'].include?('how_to_cite')
v = view('how_to_cite' => 'Verified', 'ids' => { 'biotools' => 'bt' })
check '3 verified citation beats registry', v['how_to_cite'] == 'Verified' && v['pending'].empty?
v = view('ids' => { 'biotools' => 'bt' })
check '3 registry licence verified with verified ids', v['license'] == ['MIT'] && v['license_pending'].empty?
v = view('pending' => { 'ids' => { 'biotools' => 'bt' } })
check '3 registry licence pending with pending ids', v['license'].empty? && v['license_pending'] == ['MIT']

# 4 a written licence, even unconfirmed, blocks the registry licence
v = view('license' => ['unconfirmed'], 'ids' => { 'github' => 'o/r' })
check '4 unconfirmed licence not replaced', v['license'].empty? && v['license_pending'].empty?
v = view('license' => ['unconfirmed'], 'pending' => { 'ids' => { 'github' => 'o/r' } })
check '4 unconfirmed licence not replaced (pending ids)', v['license'].empty? && v['license_pending'].empty?
v = view('cost' => 'Unconfirmed', 'pending' => { 'cost' => 'Free' })
check '4 verified unconfirmed cost hides pending cost', v['cost'].nil? && !v['pending'].include?('cost')

# 5 activity
v = view('deprecated' => true, 'pending' => { 'ids' => { 'github' => 'o/r' } })
check '5 verified deprecated, ids pending: verified', v['activity']['label'].start_with?('Deprecated') && v['activity_pending'] == false
v = view('ids' => { 'github' => 'o/r' }, 'pending' => { 'deprecated' => true })
check '5 pending deprecated does not hide verified activity', v['activity']['status'] == 'active' && v['activity_pending'] == false
v = view('pending' => { 'deprecated' => true })
check '5 pending deprecated alone is pending', v['activity']['label'].start_with?('Deprecated') && v['activity_pending'] == true
v = view('links' => { 'homepage' => 'https://a.org' })
check '5 no activity, nothing pending', v['activity'].nil? && v['activity_pending'] == false && v['has_pending'] == false

# 6 ids verified one by one
v = view('ids' => { 'biotools' => 'bt' }, 'pending' => { 'ids' => { 'github' => 'o/r' } })
links = v['more_links'].to_h { |l| [l['url'], l['pending']] }
check '6 bio.tools link verified', links['https://bio.tools/bt'] == false
check '6 github link pending', links['https://github.com/o/r'] == true
check '6 metrics from verified ids', v['metrics']['citation_count'] == 5 && v['metrics']['github_stars'].nil? && v['metrics_pending'].nil? && v['metrics']['source'] == 'bio.tools'
v = view('pending' => { 'ids' => { 'biotools' => 'bt', 'github' => 'o/r' } })
check '6 metrics from pending ids are pending', v['metrics']['github_stars'] == 7 && v['metrics_pending'] == true && v['metrics']['source'] == 'bio.tools and GitHub'

# 10 docs note
v = view('links' => { 'homepage' => 'https://a.org', 'docs_note' => 'On the website' }, 'pending' => { 'links' => { 'docs' => 'https://d.org' } })
check '10 verified note kept when docs pending', v['docs_note'] == 'On the website' && v['pending'].include?('links.docs')
v = view('links' => { 'homepage' => 'https://a.org', 'docs' => 'https://d.org', 'docs_note' => 'On the website' })
check '10 note dropped when docs verified', v['docs_note'].nil?

# 12 related tools limited to known ids
Jekyll::WARNINGS.clear
v = view('related' => %w[b zz], 'pending' => { 'related' => %w[c yy] })
check '12 unknown related ids dropped', v['related'] == ['b'] && v['related_pending'] == ['c'] && Jekyll::WARNINGS.size == 2

# 7 + 8 enrichment: CITATION.cff dates, fetched_at kept when a fetch fails
e_mod = Jekyll::ToolEnrichment
cff = "cff-version: 1.2.0\ntitle: Tool\nauthors:\n  - given-names: Ann\n    family-names: Lee\ndate-released: 2024-05-01\nversion: 1.0\n"
check '7 CITATION.cff with a date', e_mod.format_cff(cff) == 'Ann Lee (2024) Tool. Version 1.0.'
module Jekyll::ToolEnrichment
  def self.get_text(*) = nil
  def self.save_cache(*) = nil
end
e_mod.instance_variable_set(:@cache, { 'x' => { 'at' => 0, 'v' => Jekyll::ToolEnrichment::CACHE_VERSION, 'data' => { 'github_stars' => 3, 'fetched_at' => '2026-01-01' } } })
check '8 failed fetch keeps fetched_at', e_mod.real_enrich(nil, { 'github' => 'x' })['fetched_at'] == '2026-01-01'
e_mod.instance_variable_set(:@cache, {})
check '8 failed fetch without cache has no date', e_mod.real_enrich(nil, { 'github' => 'y' }) == {}

puts $fails.zero? ? 'all passed' : "#{$fails} failed"
