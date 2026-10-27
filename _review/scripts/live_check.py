"""Checks the built tool pages (_site) against the verified values in _data/tools_v2.yml.

The live view is the page with every .tp-pending element removed. Run with the scratchpad venv:
v/bin/python live_check.py
"""
import glob, os, re, sys
import yaml
from bs4 import BeautifulSoup

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..'))
SITE = os.environ.get('SITE', f'{ROOT}/_site')
NOT_SHOWN = {'unconfirmed', 'not applicable'}
data = yaml.safe_load(open(f'{ROOT}/_data/tools_v2.yml'))
types = yaml.safe_load(open(f'{ROOT}/_data/tool_types.yml'))
local = [t['name'] for t in types if t.get('source') == 'local']
stages = [s['name'] for s in yaml.safe_load(open(f'{ROOT}/_data/lifecycle_stages.yml'))]
by_name = {e['name']: e for e in data}

def txt(el):
    return re.sub(r'\s+', ' ', el.get_text(' ')).strip() if el else None

problems, seen = [], set()
for f in sorted(glob.glob(f'{SITE}/**/*.html', recursive=True)):
    html = open(f, encoding='utf-8').read()
    if 'class="tp-hero"' not in html:
        continue
    full = BeautifulSoup(html, 'html.parser')
    live = BeautifulSoup(html, 'html.parser')
    for el in live.select('.tp-pending'):
        el.decompose()
    title = re.sub(r'^tool : ', '', txt(full.select_one('h1')))
    e = by_name.get(title)
    if not e:
        problems.append(f'{f}: no tool named {title!r}')
        continue
    seen.add(e['id'])
    links = e.get('links', {})
    bad = lambda what, got, want: problems.append(f"{e['id']}: {what}: page {got!r}, data {want!r}")

    got = txt(live.select_one('.tp-lead'))
    if got != e.get('short_description'): bad('short description', got, e.get('short_description'))

    about = next((s for s in live.select('section.tp-section') if txt(s.h2) == 'About'), None)
    got = txt(about.p) if about else None
    want = re.sub(r'\s+', ' ', e['description']).strip() if e.get('description') else None
    if got != want: bad('about', got, want)

    vt = e.get('tool_type', [])
    vt = [t for t in vt if t in local] + [t for t in vt if t not in local]
    got = [txt(s) for s in live.select('.tp-type')]
    if got != vt: bad('types', got, vt)

    got = [txt(s) for s in live.select('.tp-domain')]
    if got != e.get('domains', []): bad('domains', got, e.get('domains', []))

    btn = live.select_one('.tp-btn:not(.tp-verified-alt)') or live.select_one('.tp-btn')
    btn = live.select_one('.tp-btn')
    want = 'Open the tool' if links.get('homepage_opens_tool') is True else 'Visit website'
    if not btn or btn['href'] != links.get('homepage') or not txt(btn).startswith(want):
        bad('button', btn and (btn['href'], txt(btn)), (links.get('homepage'), want))

    facts = {txt(d.dt): txt(d.dd) for d in live.select('.tp-facts > div')}
    lic = [l for l in e.get('license', []) if l.lower() not in NOT_SHOWN]
    if facts.get('Licence') != (' / '.join(lic) or None): bad('licence', facts.get('Licence'), lic)
    cost = e.get('cost') if str(e.get('cost')).lower() not in NOT_SHOWN else None
    if facts.get('Cost') != cost: bad('cost', facts.get('Cost'), cost)
    if facts.get('Source code') != (' / '.join(e.get('code_availability', [])) or None): bad('source code', facts.get('Source code'), e.get('code_availability'))

    letters = [x for x in e.get('fair', []) if x != 'planning']
    got = [txt(s) for s in live.select('.tp-fair-l.on')]
    if got != letters: bad('FAIR on', got, letters)
    if not letters and live.select('.tp-fair-l'): bad('FAIR letters shown', len(live.select('.tp-fair-l')), 0)
    if bool(live.select('.tp-fair-plan')) != ('planning' in e.get('fair', [])): bad('planning', bool(live.select('.tp-fair-plan')), e.get('fair'))
    want = [s for s in stages if s in e.get('lifecycle', [])]
    got = [txt(s) for s in live.select('.tp-cycle span.on')]
    if got != want: bad('life cycle on', got, want)
    if not want and live.select('.tp-cycle'): bad('life cycle shown', True, False)

    got = [txt(k) for k in live.select('.tp-keyword')]
    if got != e.get('keywords', []): bad('keywords', got, e.get('keywords', []))
    got = [a.get('title') or txt(a) for a in live.select('.tp-logos > *')]
    if got != e.get('institutes', []): bad('institutes', got, e.get('institutes', []))

    for s in live.select('section.tp-section'):
        if not [c for c in s.find_all(True, recursive=False) if c.name != 'h2'] or not txt(s).replace(txt(s.h2), '').strip():
            bad('empty section', txt(s.h2), None)
    if live.select('.add-grid'): bad('right column', True, False)

    marked = [el for el in full.select('.tp-pending, .tp-on-pending, .tp-verified-alt') if 'tp-preview-note' not in el.get('class', [])]
    says_none = 'this tool has none' in txt(full.select_one('.tp-preview-note'))
    if says_none == bool(marked): bad('banner says none', says_none, f'{len(marked)} marked elements')

missing = {e['id'] for e in data} - seen
if missing: problems.append(f'no page for {sorted(missing)}')

cat = BeautifulSoup(open(glob.glob(f'{SITE}/**/tool_selection*.html', recursive=True)[0] if glob.glob(f'{SITE}/**/tool_selection*.html', recursive=True) else glob.glob(f'{SITE}/**/tool-selection*/index.html', recursive=True)[0], encoding='utf-8'), 'html.parser')
titles = [txt(c.select_one('.card-title, h3, h4, h5')) for c in cat.select('.navigation-tiles .col')]
if titles != sorted(titles, key=str.lower): problems.append(f'catalogue order: {titles}')

print(f'{len(seen)} tool pages, {len(titles)} catalogue cards')
print('\n'.join(problems) or 'no problems')
