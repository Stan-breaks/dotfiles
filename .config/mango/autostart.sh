#! /bin/bash

set +e


gsettings set org.gnome.desktop.interface text-scaling-factor 1.0

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots

"$HOME/.config/scripts/randomWallpaper.sh" "$HOME/Pictures/wallpapers/saitama.jpeg" &

waybar -c ~/.config/mango/config.jsonc -s ~/.config/mango/style.css &

batterynotify.sh &

dunst &

udiskie &

wl-paste --type text --watch cliphist store &
wl-paste --type image --watch cliphist store &

wlsunset -T 6500 -t 3500 &

notify-send -i /home/Stanbreaks/Pictures/logo.png -t 14000 "Hey Stanley. Glad you're back." "Let’s get to work." &

# Permission authentication
/usr/lib/xfce-polkit/xfce-polkit &












#
