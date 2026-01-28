#! /bin/bash

feh --bg-fill --no-fehbg ~/Pictures/wallpapers/wallhaven-6llxkw.jpg &
xsetroot -cursor_name xC_left_ptr
dunst &
notify-send -i /home/Stanbreaks/Pictures/logo.png -t 14000 "Hey Stanley. Glad you're back." "Let’s get to work." &
export PATH="$PATH:$HOME/.local/bin"

