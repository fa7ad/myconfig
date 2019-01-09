#!/usr/bin/env fish

bass source /etc/environment
bass source /etc/profile

# Editors
set -gx EDITOR vim
set -gx VISUAL vim
set -gx PAGER less

# Go
set -gx GOPATH $HOME/go

# N
set -gx N_PREFIX /usr/local/n

# virtualfish
set -gx VIRTUALFISH_HOME /ldata/.virtualfish

# android
set -gx ANDROID_HOME /ldata/ANDROID_SDK

# Add to PATH
set -l ruby_paths (string split \  $HOME/.gem/ruby/*/bin)
set -l user_paths $HOME/.bin $HOME/.local/bin
set -l node_paths $N_PREFIX/bin
set -l snap_paths /snap/bin /var/lib/snapd/snap/bin


set -gx PATH $PATH $user_paths $ruby_paths $node_paths $GOPATH/bin $snap_path
vardedupe PATH
set -U fish_user_paths $PATH
