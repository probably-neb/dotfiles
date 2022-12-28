#!/bin/bash

selection=$(hacksaw -f "-i %i -g %g")
imgpath="/home/neb/Pictures/$(date "+%Y-%m-%d-%T")-screenshot.png"
if [[ $1 ]]; then
    imgpath=$1
fi
shotgun $selection - | tee $imgpath | xclip -t 'image/png' -selection clipboard
echo $imgpath
