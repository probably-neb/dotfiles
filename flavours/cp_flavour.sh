#!/bin/bash

TYPE=$1
NAME=$2

if [[ "${TYPE}" != "template" ]] && [[ "${TYPE}" != "scheme" ]]; then
   echo "Invalid option: ${TYPE}. choose one of \"template\" or \"scheme\""
   exit 1
fi

cp -vr ~/.local/share/flavours/base16/${TYPE}s/${NAME} ./${TYPE}s/
