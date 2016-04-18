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


# zshrc
alias zshrc="${EDITOR} ~/.zshrc"


# Obvious short hands
alias sshx='ssh -X'
alias cls='clear'
alias sl='/usr/bin/env sl && l'


# Python3
alias python='python3'
alias pip3='sudo pip3'


# Open files
alias opn='xdg-open'


# mpv +history
alias mpv='mpvh'
alias mpa='mpv --no-vid'


# Reload
alias reloadpath='PATH=$PATH'
alias reloadzsh='source ~/.zshrc'


# apt shorthand
alias adu='agud'


# VIm helpers
alias vim_install_packages='vim +BundleInstall! +BundleClean! +q!'
function vim_clear_cache {
  rm -rf ~/.vim{backup,swap,undo,views}
  echo -e "\033[0;32mVim cache is cleared, your vimrc changes should take effect"
}


# mps-youtube helper
function upgrade_mpsyt_dev {
  pip3 install --upgrade \
    https://github.com/mps-youtube/pafy/archive/develop.zip \
    https://github.com/mps-youtube/mps-youtube/archive/develop.zip
}


# Make directory and change directory
function mkcd {
  mkdir -p "$@" && cd $_
}


# Touch files recursively, creating directories along the way
function tch {
  if [ $# -lt 1 ];then
    echo "Missing arguments"
    return 1
  fi
  for f in "$@"; do
    mkdir -p "$(dirname $f)" && touch $f && cd "$(dirname $f)"
  done
}


# Copy files to clipboad
function fcopy {
  xsel -ib<$1
}


# Toggle the Version control in my home folder
function togglehomegit {
  if [ -d "${HOME}/.git" ]; then
    mv "${HOME}/.git" "${HOME}/no.git"
  elif [ -d "${HOME}/no.git" ]; then
    mv "${HOME}/no.git" "${HOME}/.git"
  else
    echo -e '\033[7;31mNo trace of a git repo in your HOME directory. Sorry'
    return 1
  fi
}
