# My configuration files

These are the dotfiles/configurations for most of my CLI apps

---

## Requirements
For terminal:

* zsh
* fontconfig
* python3

...

## Put it together

```bash
mkdir -p ~/.fonts/ ~/.config/fontconfig/conf.d/
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf

git clone git@github.com:fa7ad/myconfig --branch arch --recursive
cd myconfig
git submodule update --init --recursive
zsh INSTALL.zsh
sleep 10 && chsh -s /bin/zsh
```

## Update:
```
update_config
```
