#!/bin/bash

SCREENLAYOUT_DIR=~/.screenlayout
SCREENLAYOUTS=$( ls --color=never --format=single-column ${SCREENLAYOUT_DIR} )
CHOICE=$(printf "%s" "${SCREENLAYOUTS}" | fzf) 
eval "${SCREENLAYOUT_DIR}/${CHOICE}"
