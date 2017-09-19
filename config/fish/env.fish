#!/usr/bin/env fish

bass source /etc/environment
bass source /etc/profile

# Editors
set -gx EDITOR vim
set -gx VISUAL vim
set -gx PAGER less

# N
set -gx N_PREFIX /usr/local/n

# Add to PATH
# set -gx PATH $PATH /usr/local/sbin /usr/local/bin /usr/bin /usr/sbin
set -gx PATH $PATH $HOME/.bin $HOME/.local/bin (echo $HOME/.gem/ruby/*/bin) $N_PREFIX/bin node_modules/.bin

