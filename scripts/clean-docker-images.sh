#!/usr/bin/env bash

TAG=2
ID=4
docker image list | rg -r ' ' ' +' | cut -d' ' -f${TAG},${ID} | rg '<none>' | cut -d' ' -f2 | xargs docker image rm

