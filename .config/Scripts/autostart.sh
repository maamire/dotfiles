#!/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

run "nm-applet"
run "picom" -b
run "$HOME/.config/Scripts/changeWallpaper.sh"
run "blueman-applet"
run /usr/bin/unclutter --timeout 5 --jitter 3 --ignore-buttons 4,5,6,7
run "clipmenud"
