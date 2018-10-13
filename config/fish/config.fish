#!/usr/bin/env fish
function fish_greeting
  fortune -as
end

set cwd (dirname (status -f))

# Load env files
. $cwd/env.fish

# load aliases
. $cwd/alias.fish
