#!/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

run "nm-applet"
run "picom" -b
run "$HOME/.fehbg"
# run "" 
