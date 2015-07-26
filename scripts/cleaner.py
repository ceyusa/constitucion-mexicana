#!/usr/bin/env python3

import io
import sys
import lxml
from lxml.html.clean import Cleaner

cleaner = Cleaner()
cleaner.javascript = True
cleaner.style = True
cleaner.remove_tags = ['div', 'span', 'table', 'td', 'tr', 'img']

tree = cleaner.clean_html(lxml.html.parse(sys.stdin))
data = lxml.html.tostring(tree, with_tail=False)

print(data.decode())
