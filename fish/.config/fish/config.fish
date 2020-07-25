#!/usr/bin/env fish
starship init fish | source

function fish_greeting
  fortune -as
end

set cwd (dirname (status -f))

# Load env files
. $cwd/env.fish

# load aliases
. $cwd/alias.fish

function clear_prompt
  clear
  fish_prompt
end

bind \cl clear_prompt
