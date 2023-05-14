#!/usr/bin/env fish
starship init fish | source

function fish_greeting
  fortune -s
end

function fish_right_prompt
end

set -gx fish_user_conf_dir $HOME/.config/fish # (dirname (status -f))

# Load env files
source $fish_user_conf_dir/env.fish

# load aliases
source $fish_user_conf_dir/alias.fish

function clear_prompt
  clear
  fish_prompt
end

bind \cl clear_prompt

# set -gx sudope_sequence \e
bind ß sudope

thefuck --alias | source

