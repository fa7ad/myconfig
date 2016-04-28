#!/usr/bin/env bash
sudo apt-get update
sudo apt-get upgrdae -y
sudo apt-get install git zsh build-essential ubuntu-restricted-extras vim-gtk -y
sudo apt-add-repository ppa:djcj/vapoursynth -y
sudo apt-get update
sudo apt-get install mpv vapoursynth-extra-plugins rxvt-unicode-256color
wget -O- https://github.com/github/hub/releases/download/v2.2.3/hub-linux-amd64-2.2.3.tgz | tar xz
cd hub-linux-amd64-2.2.3 && sudo bash install
chsh -s /bin/zsh
