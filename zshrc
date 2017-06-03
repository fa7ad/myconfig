# Include prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Source zshenv to make changes immidiate
source "${ZDOTDIR:-$HOME}/.zshenv"

# Disable autocorrecting entered commands
unsetopt CORRECT

# Add custom folders to PATH
PATH+=":$HOME/.bin:$HOME/.local/bin:$HOME/.config/composer/vendor/bin"

# Add Ruby gems to PATH
gempath=$(echo $HOME/.gem/ruby/*/bin | sed 's/\ /\:/g')
PATH+=":$gempath"

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
  sudo systemctl stop nginx php-fpm mariadb
}

function start_emp {
  sudo systemctl start nginx php-fpm mariadb
}

alias phpu='php -dzend_extension=xdebug.so $(which phpunit)'
alias ....='../..'
alias tree='tree -I "node_modules|bower_components"'
alias \%='command'

alias systop='sudo systemctl stop'
alias systart='sudo systemctl start'
alias syrest='sudo systemctl restart'

alias irssi='screen irssi'

export N_PREFIX="/usr/local/n"
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# window buttons
if [ $(gsettings get com.solus-project.budgie-wm button-layout) != "'close,minimize,maximize:'" ]; then
  gsettings set com.solus-project.budgie-wm button-layout 'close,minimize,maximize:'
fi

# Dedupe and export PATH
export PATH=$(zsh -fc "typeset -TU P=$PATH p; echo \$P")

# ===== Automatically Added ===== #

# tabtab source for yarn package
# uninstall by removing these lines or running `tabtab uninstall yarn`
[[ -f /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh ]] && . /usr/local/lib/node_modules/yarn-completions/node_modules/tabtab/.completions/yarn.zsh

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh
