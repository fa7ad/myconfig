#!/usr/bin/env fish
function fish_greeting
  fortune -o
end

set cwd (dirname (status -f))

### LOAD fundle
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

# Plugins
fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/oh-my-fish-core'
fundle plugin 'tuvistavie/fish-fastdir'
fundle plugin 'tuvistavie/fish-completion-helpers'
fundle plugin 'oh-my-fish/plugin-balias'
fundle plugin 'oh-my-fish/plugin-sudope'
fundle plugin 'oh-my-fish/plugin-bang-bang'
fundle plugin 'oh-my-fish/plugin-archlinux'
fundle plugin 'oh-my-fish/plugin-python'
fundle plugin 'oh-my-fish/plugin-thefuck'

# Theme
fundle plugin 'hauleth/agnoster'
# fundle plugin 'fisherman/flash'

# Start Fundle
fundle init

# Load env files
. $cwd/env.fish

# load aliases
. $cwd/alias.fish

