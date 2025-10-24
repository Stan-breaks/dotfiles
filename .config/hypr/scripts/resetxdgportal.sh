#!/usr/bin/env bash

sleep 1
killall -e xdg-desktop-portal-hyprland
killall -e xdg-desktop-portal
sleep 1

libDir=/usr/lib

# We will run it safely as a service!
$libDir/xdg-desktop-portal-hyprland
sleep 1
$libDir/xdg-desktop-portal &
