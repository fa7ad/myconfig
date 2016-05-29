# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


# Key timeout
export KEYTIMEOUT=1


# virtualenvwrapper stuff
export PROJECT_HOME="$HOME/PyProjects"
export WORKON_HOME="$HOME/.virtualenvs"
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'


# GitHub Hub CLI Config
export GITHUB_USER='fa7ad'
export GITHUB_PASSWORD=$(base64 -d <<< ${MYGITPASS})


export GOPATH=$HOME/go
export GOROOT=/usr/lib/go

export COMPOSER_ROOT=$HOME/.config/composer

export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:node_modules/.bin:$COMPOSER_ROOT/vendor/bin"
