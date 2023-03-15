#!/usr/bin/env fish
set cwd (dirname (status -f))

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

# update_config
function update_config
  set curr (pwd)
  cd $HOME/myconfig
  git pull -X theirs
  rsync -ar config/ $HOME/.config/
  cd $cur
end

# passwordless sudo
function getsudo
  echo $MYPASSWORD_CLEARTEXT | sudo -S echo 'Got SUDO!'
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

# Compile and run C++ programs
function cpp_compile
  g++ -Wall -O3 -o $argv[2] $argv[1]
  and exec ./$argv[2]
end

# Source the Yuuge alias files
for file in (ls $cwd/_aliases/*.fish)
  . $file
end

function catcat
  bat $argv
end

alias vim='nvim'

alias python='python3'

## cisco tomfoolery
function load_cisco_vpn
  sudo launchctl load /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist
  /Applications/Cisco/Cisco\ AnyConnect\ Socket\ Filter.app/Contents/MacOS/Cisco\ AnyConnect\ Socket\ Filter -activateExt
  open /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app
end

function unload_cisco_vpn
  sudo launchctl unload /Library/LaunchDaemons/com.cisco.anyconnect.vpnagentd.plist
  /Applications/Cisco/Cisco\ AnyConnect\ Socket\ Filter.app/Contents/MacOS/Cisco\ AnyConnect\ Socket\ Filter -deactivateExt
end
