# Include prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source zshenv to make changes immidiate
source "${ZDOTDIR:-$HOME}/.zshenv"

# Disable autocorrecting entered commands
unsetopt CORRECT


# mpv +history
alias mpv='mpvh'
alias mpa='mpv --no-vid'

# look up aliases
function als {
  alias | grep "$1" | less
}

# git ignore
function gign {
  echo "$1" >>! .gitignore
}

# update myconfig
function update_config {
    current=$(pwd)
    cd "${ZDOTDIR:-$HOME}/myconfig"
    git pull -X theirs
    rsync -ar .config/ "${ZDOTDIR:-$HOME}/.config/"
    cd $current
}

# get sudo without pass
function getsudo {
  sudo -S echo 'Got SUDO!' <<< ${MYPASSWORD_CLEARTEXT}
}

alias phpu='php -dzend_extension=xdebug.so $(which phpunit)'
alias ....='../..'
alias ......='../../..'
