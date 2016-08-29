#!/bin/bash
gsettings set org.gnome.desktop.background show-desktop-icons true
syndaemon -i 0.1 -d -t -k
