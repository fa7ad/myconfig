#!/usr/bin/env zsh

if [ -n "$(pidof nm-applet)" ]; then
  killall nm-applet
fi

nm-applet "$@" &!
