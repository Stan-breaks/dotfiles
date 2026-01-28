#!/usr/bin/env bash

file="/home/Stanbreaks/Pictures/Screenshots/$(date)_grim.png"
case "$1" in
   -p)
  grim -g "$(slurp)" "$file" || notify-send -t 2000 "Screenshot failed"
  ;;
   *) 
  grim "$file" || notify-send -t 2000 "Screenshot failed"
esac


swappy -f "$file"
cat "$file" | wl-copy --type image/png
rm "$file"
