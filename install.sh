#!/usr/bin/env bash
echo "Updating currently installed apps"
sudo apt-get update
sudo apt-get upgrdae -y

echo "Installing the bare minimum stuff"
sudo apt-get install git zsh build-essential ubuntu-restricted-extras vim-gtk rxvt-unicode-256color -y

echo "Installing mpv"
sudo apt-add-repository ppa:djcj/vapoursynth -y
sudo apt-get update
sudo apt-get install mpv vapoursynth-extra-plugins

echo "Installing 'hub' by github"
wget -O- https://github.com/github/hub/releases/download/v2.2.3/hub-linux-amd64-2.2.3.tgz | tar xz
cd hub-linux-amd64-2.2.3 && sudo bash install

echo "Switch to zsh"
chsh -s /bin/zsh

echo "Finally grabbing my config."
git clone https://github.com/fa7ad/myconfig .f7config --recursive
rsync -avh --progress .f7config/ ./

echo "Install whatever else you need."
echo 'Links for most of my apps are here: https://github.com/fa7ad/myconfig/blob/master/README.md'
