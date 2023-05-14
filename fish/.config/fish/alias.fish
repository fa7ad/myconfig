#!/usr/bin/env fish
# MPV
alias mpa 'mpv --no-vid'

# download using axel
abbr axl 'axel -an 4'

# systemd
abbr systop 'sudo systemctl stop'
abbr systart 'sudo systemctl start'
abbr syrest 'sudo systemctl restart'

# irssi
alias irssi='screen irssi'

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
# alias pip3='python3 -m pip'

# LS
alias ls='gls --group-directories-first --color=auto'
alias l='ls -lFh'
alias la='ll -lAFh'
alias ll='ls -lh'
alias lsa='ls -lah'

# Source the Yuuge alias files
for file in $fish_user_conf_dir/_aliases/*
  . $file
end

function catcat
  bat $argv
end

alias vim='nvim'

alias python='python3'
