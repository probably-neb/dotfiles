#!/usr/bin/env python3
from PIL import ImageColor
import sys

as_float = False
with_alpha = False
argv = sys.argv[1:]
if '-f' in argv:
    argv.remove('-f')
    as_float = True
if  '-a' in argv:
    argv.remove('-a')
    with_alpha = True

codes = []
if len(argv) == 0:
    for code in input('').split(' '):
        if not code:
            continue
        codes.append(code)
else:
    for h in argv:
        if not h.startswith('#'):
            h = '#' + h
        codes.append(h)
for code in codes:
    colors = ImageColor.getcolor(code,"RGBA")
    if as_float:
        colors = tuple(map(lambda n: float(f'{n / 255.:.4f}'), colors))
    if not with_alpha:
        colors = colors[:3]
    print(code,":",colors)

