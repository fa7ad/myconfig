#!/usr/bin/env zsh
#nitrogen --restore --force-setter=gnome
./feh2gnome
gsettings set org.gnome.desktop.background show-desktop-icons true

gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:appmenu'
gsettings set org.gnome.shell.extensions.classic-overrides button-layout 'close,minimize,maximize:appmenu'
