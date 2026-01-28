#!/usr/bin/env bash

# Detect WM
wm="${XDG_CURRENT_DESKTOP:-unknown}"


# Map quit commands
case "$wm" in
    Hyprland) hyprctl dispatch exit 0 ;;
    river) riverctl quit ;;
    niri) niri-msg quit ;;
    mango) mmsg -d quit;;
    bspwm) bspc quit ;;
    dwm) notify-send "dwm quit: use Mod+Shift+q" ;;
    xmonad) xmonad --quit ;;
    oxwm) oxwm-quit ;;
    *) echo "Unknown WM: $wm" ;;
esac
