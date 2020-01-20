#!/usr/bin/env fish

for dir in */
    stow $dir
end

curl -L https://get.oh-my.fish > install
fish install --path=~/.local/share/omf --config=~/.config/omf
rm install
