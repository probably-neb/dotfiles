#!/bin/bash

COMIC_DIR="$HOME/Pictures/xkcd"

if [ ! -d "$COMIC_DIR" ]; then
    mkdir -p "$COMIC_DIR"
fi

XKCD_INFO_URL="https://xkcd.com/info.0.json"

CURRENT_XKCD_INFO=$(curl -s $XKCD_INFO_URL)

echo $(echo $CURRENT_XKCD_INFO | jq '.')

CURRENT_XKCD=$(curl -s $XKCD_INFO_URL | jq -r '.num')

echo "Current XKCD is $CURRENT_XKCD"

RANDOM_PIC_NUM=$(( ( RANDOM % $CURRENT_XKCD )  + 1 ))

echo "Random XKCD is $RANDOM_PIC_NUM"

COMIC_URL="https://xkcd.com/$RANDOM_PIC_NUM/info.0.json"

COMIC_INFO=$(curl -s $COMIC_URL)

COMIC_TITLE=$(echo $COMIC_INFO | jq -r '.title')

COMIC_IMG_URL=$(echo $COMIC_INFO | jq -r '.img')

COMIC_FILE_PATH="$COMIC_DIR/$RANDOM_PIC_NUM-$COMIC_TITLE.png"

curl -s $COMIC_IMG_URL -o $COMIC_FILE_PATH

if [ "$TERM" = "xterm-kitty" ]; then
    kitty +kitten icat $COMIC_FILE_PATH
# else if feh is installed
elif [ -x "$(command -v feh)" ]; then
    echo "not in kitty using feh"
    feh $COMIC_FILE_PATH
else
    echo "No image viewer found."
fi

# TODO:
# today downloaded:
#   no  => download today and show + delete previous today
#   yes => show random
# regardless:
#   download random in background (overwriting current random)
