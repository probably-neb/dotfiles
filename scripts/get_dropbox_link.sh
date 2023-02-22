#!/bin/bash

SRC=$1
DEST=${2:-"db:tmp"}

if [[ -f "${SRC}" ]]; then
    RES="${DEST}/$(basename ${SRC})"
else
    RES=${DEST}
fi

rclone copy ${SRC} ${DEST}

rclone link ${RES}
