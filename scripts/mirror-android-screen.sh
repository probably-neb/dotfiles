#!/usr/bin/bash

adb exec-out screenrecord --output-format=h264 - |
                 ffplay -framerate 60 -probesize 32 -sync video  -
