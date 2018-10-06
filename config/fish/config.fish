#!/usr/bin/env fish
function fish_greeting
  fortune -as
end

set cwd (dirname (status -f))

# Install Fisher
if not functions -q fisher
    echo "Installing fisher for the first time..." >&2
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fisher
end

# Theme
# fundle plugin 'hauleth/agnoster'
# fundle plugin 'fisherman/flash'
# fundle plugin 'fisherman/sol'

# -- fundle plugin 'rafaelrinaldi/pure' --
# Installed using the built-in installer, check on gh

# Load env files
. $cwd/env.fish

# load aliases
. $cwd/alias.fish
