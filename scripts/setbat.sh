#!/bin/bash

if [ $# -eq 0 ]; then 
  echo "NO ARGS SUPPLIED. usage: \`setbat {beg} {end}\`"
  exit 1
fi

if [ $# -eq 2 ] && [[ $1 =~ ^-?[0-9]+$ ]] && [[ $2 =~ ^-?[0-9]+$ ]]; then
    echo "$1 $2" > '/sys/devices/platform/huawei-wmi/charge_control_thresholds'
fi
