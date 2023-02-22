#!/bin/bash

# capitalize lang
LANG="${1^}"
# TODO: some langs are links to other lang, if this is annoying can rerun with linked lang
URL="https://raw.githubusercontent.com/github/gitignore/main/${LANG}.gitignore"

curl "${URL}"
