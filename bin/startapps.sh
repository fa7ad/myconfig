#!/usr/bin/env zsh
source /etc/profile.d/env.sh

setxkbmap -model asus_laptop -layout us -option compose:menu
ibus-daemon -rd
numlockx on

compton -f &
light-locker &
~/.fehbg

xset dpms 600 600 0
xss-lock ~/.bin/lock.sh &

mpd &
dunst &

gtk-launch google-chrome
gtk-launch clipit
gtk-launch albert

