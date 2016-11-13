# Include prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source zshenv to make changes immidiate
source "${ZDOTDIR:-$HOME}/.zshenv"

# Disable autocorrecting entered commands
unsetopt CORRECT

# lua
export LUA_PATH="$LUA_PATH;$HOME/.luarocks/share/lua/5.2/?.lua;$HOME/.luarocks/share/lua/5.2/?/init.lua;$HOME/.luarocks/share/lua/5.3/?.lua;$HOME/.luarocks/share/lua/5.3/?/init.lua"
export LUA_CPATH="$LUA_CPATH;$HOME/.luarocks/lib/lua/5.2/?.so;$HOME/.luarocks/lib/lua/5.3/?.so"

# PATH
export PATH="$HOME/.bin:$HOME/.luarocks/bin:$HOME/.local/bin:$HOME/.config/composer/vendor/bin:$HOME/.gem/ruby/2.3.0/bin:/ldata/android-studio/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

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

# LEMP
function stop_emp {
  _ systemctl stop {nginx,php-fpm,mariadb}
}

function start_emp {
  _ systemctl start {nginx,php-fpm,mariadb}
}

alias phpu='php -dzend_extension=xdebug.so $(which phpunit)'
alias ....='../..'
alias tree='tree -I "node_modules|bower_components"'
alias \%='command'

alias systop='sudo systemctl stop'
alias systart='sudo systemctl start'
alias syrestart='sudo systemctl restart'

alias irssi='screen irssi'

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh