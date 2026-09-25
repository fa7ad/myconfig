#!/usr/bin/env fish

# Ctrl-L = Clear screen but bring back the prompt
bind \cl clear_prompt

# Ctrl-S = prepend sudo
bind \cs sudope

starship init fish | source

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

thefuck --alias | source

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/fahad/.lmstudio/bin
# End of LM Studio CLI section


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fahad/google-cloud-sdk/path.fish.inc' ]; . '/Users/fahad/google-cloud-sdk/path.fish.inc'; end


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
