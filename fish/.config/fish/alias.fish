#!/usr/bin/env fish
set cwd (dirname (status -f))

# download using axel
abbr axl 'axel -an 4'

# tree
alias tree='tree -I "node_modules|bower_components"'

# gitignore
function gign
  echo $argv | tee --append .gitignore
end

# vim
alias vim_clear_cache='rm -rf ~/.vim{backup,swap,undo,views}'

# Obvious short hands
alias cls='clear'
abbr sshx 'ssh -X'
function mkcd
  mkdir -p $argv
  cd $argv
end

# pip
# alias pip='python3 -m pip'
alias pip3='sudo -H pip3'

# LS
alias l='ls -lFh'
alias la='ll -lAFh'
alias ll='ls -lh'
alias ls='ls --color=auto'
alias lsa='ls -lah'

# Source the Yuuge alias files
for file in $cwd/_aliases/*.fish
  . $file
end

function catcat
  bat $argv
end

alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias vimdiff="nvim -d"
