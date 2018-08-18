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

# Add to PATH
# set -gx PATH $PATH /usr/local/sbin /usr/local/bin /usr/bin /usr/sbin
set -gx PATH $PATH $HOME/.bin $HOME/.local/bin (string split \  $HOME/.gem/ruby/*/bin) $N_PREFIX/bin $GOPATH/bin

set -U fish_user_paths $PATH

# virtualfish
set -gx VIRTUALFISH_HOME /ldata/.virtualfish

# android
set -gx ANDROID_HOME /ldata/ANDROID_SDK
