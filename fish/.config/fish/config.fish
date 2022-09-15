#!/usr/bin/env fish
starship init fish | source

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

if status is-interactive
  function fish_greeting
    fortune -s
  end

  starship init fish | source
end

bind \cs sudope

set -x N_PREFIX "$HOME/n"; contains "$N_PREFIX/bin" $PATH; or set -a PATH "$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo)