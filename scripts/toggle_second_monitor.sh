#!/bin/bash

DISPLAY_SETUP_FILE="${HOME}/.config/.display_setup"
DUAL="DUAL_MONITOR"
BUILTIN="BUILTIN"

# MULTI_LAYOUT=~/.screenlayout/double_on_top.sh
MULTI_LAYOUT=~/.screenlayout/4k-lol.sh

if [[ -e $DISPLAY_SETUP_FILE ]]; then
    DISPLAY_SETUP=$(cat ${DISPLAY_SETUP_FILE})
else
    DISPLAY_SETUP=$BUILTIN
fi

if [[ -z "${DISPLAY_SETUP}" || "${DISPLAY_SETUP}" == "${BUILTIN}" ]]; then
    DISPLAY_SETUP="${DUAL}"
    COMMAND=${MULTI_LAYOUT}
elif [[ "${DISPLAY_SETUP}" == "${DUAL}" ]]; then
    DISPLAY_SETUP="${BUILTIN}"
    COMMAND=~/.screenlayout/builtin.sh
fi

if $($COMMAND); then
    echo "Switching to ${DISPLAY_SETUP}"
    echo ${DISPLAY_SETUP} > ${DISPLAY_SETUP_FILE}
fi
