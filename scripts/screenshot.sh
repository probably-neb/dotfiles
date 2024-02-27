#!/bin/bash

selection=$(hacksaw -f "-i %i -g %g")
imgpath="/home/neb/Pictures/screenshots/$(date "+%Y-%m-%d-%T")-screenshot.png"
if [[ $1 ]]; then
    imgpath=$1
fi
tmpimg=$(mktemp --suffix=.png)
shotgun $selection $tmpimg
xclip -t 'image/png' -selection clipboard $tmpimg
if [ "$imgpath" == '-' ]; then
    cat $tmpimg
else
    mv $tmpimg $imgpath
fi
