# My configuration files

Started out on Linux, but now I'm working on replacing this with the config for my macOS setup.

## Required software
* [Homebrew](https://brew.sh/)
  `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
* These homebrew formulae (all other formulae and casks should be handled by homebrew-bundle):
  ```bash
  brew install fish stow
  ```

## Set up
```bash
fish INSTALL.fish
which fish | sudo tee -a /etc/shells
chsh -s $(which fish)
brew bundle install --global
```
