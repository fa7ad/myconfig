#!/usr/bin/env fish

# Ctrl-L = Clear screen but bring back the prompt
bind \cl clear_prompt

# Option-S = prepend sudo
bind ß sudope

starship init fish | source
