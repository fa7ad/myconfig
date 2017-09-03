#!/usr/bin/env bash
current_window="$(xdotool getactivewindow)"
source <(xdotool getwindowgeometry --shell "$current_window")
echo $HEIGHT $WIDTH

