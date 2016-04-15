# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Preferred ZSH theme
export ZSH_THEME="agnoster"


# Case sensitivity in autocompletion
CASE_SENSITIVE="true"


# oh-my-zsh auto-update frequency (in days).
export UPDATE_ZSH_DAYS=15


# Disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"


# Enable command auto-correction.
# ENABLE_CORRECTION="true"


# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


# Change the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="false"


# Change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"


# Custom folder for oh-my-zsh's $ZSH/custom directory
# ZSH_CUSTOM=/path/to/new-custom-folder


# Plugins to load. (Plugins can be found $ZSH/plugins/*)
# Custom plugins may be added to $ZSH/custom/plugins/
plugins=(git debian command-not-found common-aliases npm history ubuntu sudo github virtualenv)


# PATH Configuration
export PATH="/sbin:/bin:/usr/games:/usr/local/games:$PATH"
export MANPATH="/usr/local/man:$MANPATH"


# Load OHMYZSH
source $ZSH/oh-my-zsh.sh


# Language environment
export LANG=en_US.UTF-8


# Preferred editor
export EDITOR="vim"


# Compilation flags
export ARCHFLAGS="-arch x86_64"


# SSH Private Key
export SSH_KEY_PATH="~/.ssh/id_rsa"


# VIM Timeout between keys
export KEYTIMEOUT=1


# GitHub Hub CLI Configuration
export GITHUB_USER="fa7ad"
export GITHUB_PASSWORD=$(base64 -d <<< ${MYGITPASS})


# swap out apt-get for aptitude
alias ag="sudo aptitude"
# fix autoremove
alias agru="sudo apt-get autoremove --purge"
# just in case I try dist-upgrade
alias -g dist-upgrade="full-upgrade"


# Edit zshrc from anywhere
alias zshrc="$EDITOR ~/.zshrc"
# SSH with X forwarded
alias sshx="ssh -X"
# Clear the console like Windows
alias cls="clear"
# Train LS, SL mistake easter egg
alias sl="sl -ale && l"


# Use python 3.5 by default from now
alias python="python3"
# elevate pip3
alias pip3="sudo pip3"


# Open files easily
alias opn="xdg-open"
# Alias MPV to MPV with History support
alias mpv="mpvh"
# MPV minus the Video
alias mpa="mpv --no-vid"


# reload the path and zsh
alias reloadpath='PATH=$PATH'
alias reloadzsh="source $HOME/.zshrc"


# Visual Studio code
alias code="gtk-launch code"


# Ignore some autocomplete
zstyle ':completion:*' ignored-patterns 'apturl-gtk'


# Watch a video with subtitles
watchsub(){
  subliminal download -l en $@
  rename -v 's/\.en//g' *srt
  xdg-open $@
}


# Upgrade mps-youtube to the git master
upgrade_mpsyt(){
  pip install --upgrade \
    https://github.com/mps-youtube/pafy/archive/develop.zip \
    https://github.com/mps-youtube/mps-youtube/archive/develop.zip
}


# Clear Vim's caches
vim_clear_cache(){
  rm -rf ~/.vim{backup,swap,undo,views}
  echo -e "\033[0;32mVim cache is cleared, your vimrc changes should take effect"
}


# Update and install Vundle packages
vim_install_packages(){
  vim +BundleInstall! +BundleClean +q
}


# Create and enter a directory
mkcd(){
  mkdir $@ && cd $_
}


# Touch into multiple levels even if they don't exist... yet.
tch(){
  if [ $# -lt 1 ];then
    echo "Missing argument";
    return 1
  fi
  for f in "$@"; do
    mkdir -p "$(dirname $f)" && touch $f && cd "$(dirname $f)"
  done
}


# Copy a file into the clipboard
fcopy(){
  xsel -ib<$1
}


# toggle the git status of the home directory
togglehomegit(){
  if [ -d $HOME/.git ];then
    mv $HOME/.git $HOME/no.git
  elif [ -d $HOME/no.git ]; then
    mv $HOME/no.git $HOME/.git
  else
    echo -e "\033[7;31mYour home directory is/was not a git repo!"
    return 1
  fi
}
