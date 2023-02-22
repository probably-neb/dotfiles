#!/bin/bash

DISPLAY_SETUP_FILE="${HOME}/.config/.display_setup"
DUAL="DUAL_MONITOR" 
BUILTIN="BUILTIN"

if [[ -e $DISPLAY_SETUP_FILE ]]; then
    DISPLAY_SETUP=$(cat ${DISPLAY_SETUP_FILE})
else
    DISPLAY_SETUP=$BUILTIN
fi

if [[ -z "${DISPLAY_SETUP}" || "${DISPLAY_SETUP}" == "${BUILTIN}" ]]; then
    DISPLAY_SETUP="${DUAL}"
    ~/.screenlayout/double_on_top.sh
elif [[ "${DISPLAY_SETUP}" == "${DUAL}" ]]; then
    DISPLAY_SETUP="${BUILTIN}"
    ~/.screenlayout/builtin.sh
fi

echo "Switching to ${DISPLAY_SETUP}"
echo ${DISPLAY_SETUP} > ${DISPLAY_SETUP_FILE}
