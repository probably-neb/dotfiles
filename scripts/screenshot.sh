#!/bin/bash

selection=$(hacksaw -f "-i %i -g %g")
imgpath="/home/neb/Pictures/$(date "+%Y-%m-%d-%T")-screenshot.png"
shotgun $selection - | tee $imgpath | xclip -t 'image/png' -selection clipboard
echo $imgpath
