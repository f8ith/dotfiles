#!/bin/sh

WIDTH=$(expr $3 - 2)
HEIGHT=$2
X=$(expr $4 + 1)
Y=$(expr $5 + 1)
DISPLAY_IMG="kitty +kitten icat --transfer-mode file --silent --place ${WIDTH}x${HEIGHT}@${X}x${Y}"

case $(file -b --mime-type "$1") in
    text/*) batcat "$1" ;;
    image/*) $DISPLAY_IMG $1 && exit 5;;
    video/*) ffmpegthumbnailer -i $1 -c png -o - | $DISPLAY_IMG --stdin yes && exit 5;;
    application/pdf) pdftoppm -png -f 1 -singlefile "$1" | $DISPLAY_IMG --stdin yes && exit 5;;
    application/gzip|application/x-xz) tar tf $1 ;;
    application/zip) unzip -Z -1 $1 ;;
    application/x-sharedlib) readelf -h $1 ;;
esac

exit 1
