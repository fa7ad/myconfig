#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -blur 5x5 -scale 10% -scale 1000% /tmp/screen.png
convert /tmp/screen.png ~/.config/i3/lock.png -gravity center -composite -matte /tmp/screen.png

i3lock -i /tmp/screen.png
rm /tmp/screen.png

sleep 15 && pgrep i3lock && xset dpms force off
