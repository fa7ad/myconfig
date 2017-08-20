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


# Stuff from fisherman
fundle plugin 'fisherman/last_job_id'
fundle plugin 'fisherman/humanize_duration'
fundle plugin 'fisherman/pwd_is_home'
fundle plugin 'fisherman/pwd_info'

# Theme
# fundle plugin 'hauleth/agnoster'
# fundle plugin 'fisherman/flash'
# fundle plugin 'fisherman/sol'

# -- fundle plugin 'rafaelrinaldi/pure' --
# Installed using the built-in installer, check on gh

# Start Fundle
fundle init

# Load env files
. $cwd/env.fish

# load aliases
. $cwd/alias.fish

# THEME PURE #
set fish_function_path /home/fahad/.config/fish/functions/theme-pure $fish_function_path
