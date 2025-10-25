#!/bin/bash

# Select Wallpaper Set
WALLPAPER_DIR="$HOME/Pictures/Wallpapers/Set1"

#Cache for improved performance
CACHE_FILE="/tmp/wallpaper_list.txt"
if [ ! -f "$CACHE_FILE" ] || [ $(find "$CACHE_FILE" -mmin +60 2>/dev/null | wc -l) -eq 1 ]; then
    find "$WALLPAPER_DIR" -type f > "$CACHE_FILE"
fi

WALLPAPER=$(shuf -n 1 "$CACHE_FILE")
if [ -n "$WALLPAPER" ] && [ -f "$WALLPAPER" ]; then
    nice -n 19 ionice -c 3 feh --no-fehbg --bg-fill "$WALLPAPER"
fi
