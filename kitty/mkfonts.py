import os
try:
    os.mkdir("./fonts")
except:
    pass
def is_unwanted(lc_line) -> bool:
    unwanteds = ['light', 'medium', 'heavy', 'black', 'semibold', 'thin', 'extra']
    for unwanted in unwanteds:
        if unwanted in lc_line:
            return True
    return False
            

with open("./font.conf") as f:
    contents = f.read()
    fonts = contents.split('\n\n')
    titles = []
    non_nerd = 0
    for font in fonts:
        lines = font.split('\n')
        if 'Nerd' not in lines[0]:
            non_nerd += 1
            continue
        font_family = lines[0].strip('# ')
        title = font_family.split(' ')[0]
        body = list(map(lambda l: l.strip(), lines[1:]))
        alterations = ['','bold','italic','oblique', 'medium']
        settings = {
            'font_family': font_family,
            'bold_font': None,
            'italic_font': None,
            'bold_italic_font': None
            }
        unused = []
        for line in body:
            lc_line = line.lower()
            if is_unwanted(lc_line):
                unused.append(line)
                continue
            if 'italic' in lc_line or 'oblique' in lc_line:
                if 'bold' in lc_line:
                    if settings['bold_italic_font'] is not None:
                        unused.append(settings['bold_italic_font'])
                    settings['bold_italic_font'] = line
                else:
                    if settings['italic_font'] is not None:
                        unused.append(settings['italic_font'])
                    settings['italic_font'] = line
            elif 'bold' in lc_line:
                if settings['bold_font'] is not None:
                    unused.append(settings['bold_font'])
                settings['bold_font'] = line
            else:
                unused.append(line)
                print(line)

        with open("./fonts/" + title.lower() + '.conf', 'w') as font_file:
            settings = list(map(lambda k_v: f'{k_v[0]:<20}{k_v[1]}', settings.items()))
            unused = list(map(lambda u: '# '+u, unused))
            lines = [lines[0]] + settings + unused
            font_file.write('\n'.join(lines))
        # print(title)
        titles.append(title)
    assert(len(fonts) == len(titles) + non_nerd)
    print('removed:',non_nerd)

