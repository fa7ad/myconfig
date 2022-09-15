#!/usr/bin/bash

SCRIPT="$(pwd)"

if [ ! -f /etc/yum.repos.d/shells:fish:release:3.repo ]; then
    cd /etc/yum.repos.d/
    sudo wget https://download.opensuse.org/repositories/shells:fish:release:4/CentOS_7/shells:fish:release:3.repo
fi

sudo yum install fish git fortune-mod rsync curl tar -y
sudo yum --enablerepo epel install neovim python3-neovim -y

if [ ! -d $HOME/n ]; then
    curl -L https://bit.ly/n-install | bash -s -- -y lts
fi

if [ -z "$(which starship)" ]; then
    curl -sS https://starship.rs/install.sh | sh
fi

read -p "Update fish config [y/N]? " -n 1 -r
echo    # move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
  cat <<'EOF' >> $HOME/.config/fish/config.fish

if test -f $HOME/.run-omf-install
  echo Run 'omf install' to install omf packages
  rm -f $HOME/.run-omf-install
end

EOF

fi

# rsync $SCRIPT/fish/ $HOME/ -avhP
# rsync $SCRIPT/nvim/ $HOME/ -avhP

if [ ! -d $HOME/.config/omf ]; then
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

    cat <<-EOF > $HOME/.config/omf/bundle
    package bang-bang
    package bass
    package sudope
    package z
    theme default
EOF

    touch $HOME/.run-omf-install
fi


$HOME/n/bin/npm i -g tldr eslint prettier

if [ -z "$(which hub)" ]; then
    mkdir -p /tmp/hub
    cd /tmp/hub
    curl -fsSL "https://github.com/github/hub/releases/download/v2.14.2/hub-linux-amd64-2.14.2.tgz" | tar -xz --strip-components=1
    sudo ./install
fi

chsh -s $(which fish)
