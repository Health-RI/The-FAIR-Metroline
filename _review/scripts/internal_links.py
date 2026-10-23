"""Lists internal links in the built site (_site) whose target does not exist.

Prints one line per broken link: <page> -> <href>. Usage: v/bin/python internal_links.py [site_dir]
"""
import glob, os, sys
from urllib.parse import urlparse, unquote
from bs4 import BeautifulSoup

SITE = sys.argv[1] if len(sys.argv) > 1 else '/Users/vedran/git/The-FAIR-Metroline/_site'

def exists(path):
    path = unquote(path).split('#')[0].split('?')[0]
    if path in ('', '/'):
        return True
    p = os.path.join(SITE, path.lstrip('/'))
    return any(os.path.isfile(c) for c in (p, p + '.html', os.path.join(p, 'index.html'))) or os.path.isdir(p) and os.path.isfile(os.path.join(p, 'index.html'))

broken = set()
for f in glob.glob(f'{SITE}/**/*.html', recursive=True):
    soup = BeautifulSoup(open(f, encoding='utf-8'), 'html.parser')
    page = '/' + os.path.relpath(f, SITE)
    for tag, attr in (('a', 'href'), ('img', 'src'), ('link', 'href'), ('script', 'src')):
        for el in soup.find_all(tag):
            href = el.get(attr)
            if not href:
                continue
            u = urlparse(href)
            if u.scheme or u.netloc or href.startswith(('#', 'mailto:', 'javascript:')):
                continue
            target = href if href.startswith('/') else os.path.join(os.path.dirname(page), href)
            if not exists(os.path.normpath(target)):
                broken.add(f'{page} -> {href}')
print('\n'.join(sorted(broken)))
