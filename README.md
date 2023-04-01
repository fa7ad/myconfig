# My configuration files

Started out on Linux, but now I'm working on replacing this with the config for my macOS setup.

## Required software
* [Homebrew](https://brew.sh/)
  `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* These homebrew formulae:
  ```bash
  brew install fish fortune-mod gawk gnu-sed gnu-tar go grep htop imagemagick jq neovim python@3.11 rsync thefuck wget ruby stow starship tree
  ```
* These casks from these taps:
  ```bash
  brew tap homebrew/cask-fonts
  brew install daviderestivo/fortune-mod/fortune-mod
  brew install --cask aldente font-fira-code-nerd-font font-fira-mono-nerd-font gimp inkscape aldente iterm2 visual-studio-code firefox google-chrome
  ```


## Set up
```bash
fish INSTALL.fish
which fish | sudo tee -a /etc/shells
chsh -s $(which fish)
```
