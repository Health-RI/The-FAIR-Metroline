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
links = v['listed_in'].to_h { |l| [l['url'], l['pending']] }
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
# 8 fetch: a source that does not answer keeps its previous values and date
NET = {}   # url pattern -> [status, body]
module Jekyll::ToolEnrichment
  def self.get_response(url, *) = NET.find { |pat, _| url.include?(pat) }&.last || [nil, nil]
end
NET.clear
d, failed = e_mod.fetch({ 'github' => 'x/y' }, { 'github_stars' => 3, 'fetched_at' => '2026-01-01' })
check '8 failed fetch keeps values and date', d == { 'github_stars' => 3, 'fetched_at' => '2026-01-01' } && failed == ['GitHub']
check '8 failed fetch without previous data is empty', e_mod.fetch({ 'github' => 'x/y' })[0] == {}

# 13 publications: bio.tools first, OpenAlex counts, sheet DOI only as a fallback
bt = { 'biotoolsID' => 'bt', 'publication' => [
  { 'doi' => '10.1/pre', 'metadata' => { 'citationCount' => 9, 'title' => 'Preprint' } },
  { 'doi' => '10.1/J', 'type' => ['Primary'], 'metadata' => { 'citationCount' => 4, 'title' => 'Journal', 'date' => '2020-01-01' } },
  { 'pmid' => '123', 'metadata' => { 'citationCount' => 2, 'title' => 'No DOI' } }] }
work = ->(id, n) { [200, JSON.generate('id' => id, 'cited_by_count' => n, 'title' => 'OA title', 'publication_year' => 2021)] }
NET.clear
NET['bio.tools/api/bt'] = [200, JSON.generate(bt)]
NET['doi.org/10.1/j?'] = work.call('W1', 76)
NET['doi.org/10.1/pre?'] = work.call('W1', 76)            # OpenAlex merged the preprint into the article
d, failed = e_mod.fetch({ 'biotools' => 'bt', 'doi' => '10.1/sheet' })
titles = d['papers'].map { |x| x['title'] }
check '13 bio.tools papers, primary first, sheet DOI not added', titles == ['Journal', 'Preprint', 'No DOI'] && failed.empty?
check '13 merged versions counted once, no-DOI paper keeps bio.tools count', d['citation_count'] == 76 + 2 && d['papers'][1]['duplicate'] && d['citation_source'] == 'OpenAlex'
check '13 bio.tools metadata wins, OpenAlex fills gaps', d['papers'][0]['year'] == '2020' && d['papers'][1]['year'] == '2021'
NET.clear
NET['bio.tools/api/bt'] = [200, JSON.generate(bt)]
d, failed = e_mod.fetch({ 'biotools' => 'bt' })
prev = { 'papers' => [{ 'doi' => '10.1/j', 'count' => 76, 'source' => 'OpenAlex' }], 'citation_count' => 76, 'citation_source' => 'OpenAlex', 'fetched_at' => '2026-01-01' }
d2, = e_mod.fetch({ 'biotools' => 'bt' }, prev)
check '13 OpenAlex down keeps earlier OpenAlex counts', d2['citation_count'] == 76 && d2['papers'] == prev['papers']
check '13 OpenAlex down keeps bio.tools counts', d['citation_count'] == 15 && d['citation_source'] == 'bio.tools' && failed == ['OpenAlex']
NET.clear
NET['bio.tools/api/none'] = [200, JSON.generate('biotoolsID' => 'none')]
NET['doi.org/10.1/sheet?'] = work.call('W2', 5)
NET['doi.org/10.1/unknown?'] = [404, '']
d, = e_mod.fetch({ 'biotools' => 'none', 'doi' => '10.1/sheet' })
check '13 sheet DOI used when bio.tools has no paper', d['citation_count'] == 5 && d['papers'][0]['origin'] == 'sheet'
d, failed = e_mod.fetch({ 'doi' => '10.1/unknown' })
check '13 sheet DOI unknown to OpenAlex has no count', d['papers'][0]['count'].nil? && d['citation_count'] == 0 && failed.empty?
d, = e_mod.fetch({ 'biotools' => 'none' }, { 'papers' => [{ 'doi' => '10.1/old' }], 'citation_count' => 3, 'citation_source' => 'bio.tools' })
check '13 papers removed from bio.tools do not come back', !d.key?('papers') && !d.key?('citation_count')

# 14 build reads the data file only; missing data warns once
site = Struct.new(:data).new({ 'tools_fetched' => { 'bt|o/r' => { 'github_stars' => 1 } } })
check '14 lookup by key', e_mod.real_enrich(site, { 'biotools' => 'bt', 'github' => 'o/r' }) == { 'github_stars' => 1 }
Jekyll::WARNINGS.clear
2.times { e_mod.real_enrich(site, { 'github' => 'new/repo' }) }
check '14 missing data warns once', Jekyll::WARNINGS.size == 1 && Jekyll::WARNINGS[0].include?('fetch_tool_data')

# 15 view: metrics source, publications, Listed in, no duplicate links
FAKE['cit'] = { 'citation_count' => 80, 'citation_source' => 'OpenAlex', 'fetched_at' => '2026-11-18',
                'papers' => [{ 'doi' => '10.1/a', 'title' => 'A paper', 'count' => 80, 'source' => 'OpenAlex' }] }
FAKE['cit|o/r'] = FAKE['cit'].merge('github_stars' => 7, 'repository' => 'https://github.com/o/r')
v = view('ids' => { 'biotools' => 'cit', 'github' => 'o/r', 'doi' => '10.1/a' }, 'pending' => { 'ids' => { 'rsd' => 'r' } })
check '15 source names OpenAlex', v['metrics']['source'] == 'bio.tools, GitHub and OpenAlex'
check '15 publications with DOI and Dimensions links', v['papers'][0]['url'] == 'https://doi.org/10.1/a' && v['papers'][0]['dimensions'].end_with?('/doi/10.1/a') && v['papers_pending'] == []
check '15 Listed in, verified and pending', v['listed_in'].map { |l| [l['label'], l['pending']] } == [['bio.tools', false], ['GitHub', false], ['Research Software Directory', true]]
urls = v['more_links'].map { |l| l['url'] }
check '15 more links leave out registries and the paper', urls.none? { |u| u.include?('bio.tools') || u == 'https://github.com/o/r' || u.include?('doi.org/10.1/a') }
check '15 pending Listed in counts as pending', v['has_pending']
v = view('ids' => { 'biotools' => 'bt' })
check '15 stored count, no OpenAlex', v['metrics']['source'] == 'bio.tools'

puts $fails.zero? ? 'all passed' : "#{$fails} failed"
