#!/usr/bin/env python3

import subprocess

def cmd(command):
    stdout = subprocess.run(command, stdout=subprocess.PIPE, text=True).stdout
    stdout = ''.join(stdout)
    return stdout.splitlines()

# Run the command and capture stdout
try:
    xrandr_output = cmd(['xrandr'])
    # Split output by line and remove lines starting with " "
    lines = [line for line in xrandr_output if not line.startswith(' ') and not line.startswith('Screen')]
    connected_displays = 0
    for line in lines:
        name, status, *_ = line.split()
        if status == 'connected':
            connected_displays += 1
    xrandr_active_displays = cmd(['xrandr', '--listactivemonitors'])
    # Remove the first line (which is just a header)
    active_displays = len(xrandr_active_displays) - 1
    out = f'{connected_displays}/{active_displays}'
    print(out)
    # Split each line by whitespace
except subprocess.CalledProcessError:
    print("?")
