#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import urllib.request
from lxml import html
from lxml.html.clean import Cleaner

def clean(url):
    removals = ['div', 'span', 'table', 'td', 'tr', 'img', 'br']
    cleaner = Cleaner(scripts=True,
                      embedded=True,
                      meta=True,
                      page_structure=False,
                      links=True,
                      style=True,
                      forms=True,
                      remove_tags=removals)
    with urllib.request.urlopen(url) as (f):
        tree = cleaner.clean_html(html.parse(f))
        data = html.tostring(tree, encoding='unicode', method='html')
        return data

if __name__ == "__main__":
    sys.stdout.buffer.write(clean(sys.argv[1]).encode('utf-8'))
