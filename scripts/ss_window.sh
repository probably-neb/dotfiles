#!/bin/bash
#
imgpath="/home/neb/Pictures/$(date "+%Y-%m-%d-%T")-window-screenshot.png"
if [[ $1 ]]; then
    imgpath=$1
fi
import -window `xdotool selectwindow` $imgpath
echo $imgpath
