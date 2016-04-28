# Include prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi


# Disable autocorrecting entered commands
unsetopt CORRECT


# Key timeout
export KEYTIMEOUT=1


# GitHub Hub CLI Config
export GITHUB_USER='fa7ad'
export GITHUB_PASSWORD=$(base64 -d <<< ${MYGITPASS})


# mpv +history
alias mpv='mpvh'
alias mpa='mpv --no-vid'

# override the override back to top, i dont like htop
unalias top

# i keep forgetting the other one -_-
alias gSS='git status'
