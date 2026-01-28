#!/usr/bin/env bash

[ -z "$1" ] || pkill -x swaybg ; swaybg -i "$1" -m fill &

while true; do
  sleep 120
  wall=$(find "/home/Stanbreaks/Pictures/wallpapers/" -type f | shuf -n 1)
  pkill -x swaybg; swaybg  -i "$wall" -m fill &
done

