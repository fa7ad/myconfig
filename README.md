# My configuration files

These are the dotfiles/configurations for most of my CLI apps and WM related stuff

![Preview](https://i.imgur.com/9xGyfdg.png)


## Requirements
For terminal:

* fish
* fontconfig
* python3
* neovim
* ...

## Put it together
In bash:

```bash
mkdir -p ~/.fonts/ ~/.config/fontconfig/conf.d/
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraMono/Regular/complete/Fura%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.otf
mv PowerlineSymbols.otf ~/.fonts/
mv Fura\ Mono\ Regular\ Nerd\ Font\ Complete\ Mono.otf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf

git clone git@github.com:fa7ad/myconfig --branch arch --recursive
cd myconfig
fish INSTALL.fish
sleep 10 && chsh -s $(which fish)
```
