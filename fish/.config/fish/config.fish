#!/usr/bin/env fish

# Ctrl-L = Clear screen but bring back the prompt
bind \cl clear_prompt

# Ctrl-S = prepend sudo
bind \cs sudope

starship init fish | source

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

thefuck --alias | source
