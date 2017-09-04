#!/usr/bin/env bash
source <(xdotool getwindowgeometry --shell "$@")
echo $HEIGHT $WIDTH

