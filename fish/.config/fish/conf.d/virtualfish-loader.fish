set -g VIRTUALFISH_VERSION 2.5.9
set -g VIRTUALFISH_PYTHON_EXEC $HOME/.local/pipx/venvs/virtualfish/bin/python
source $HOME/.local/pipx/venvs/virtualfish/lib/python3.12/site-packages/virtualfish/virtual.fish
source $HOME/.local/pipx/venvs/virtualfish/lib/python3.12/site-packages/virtualfish/auto_activation.fish
source $HOME/.local/pipx/venvs/virtualfish/lib/python3.12/site-packages/virtualfish/compat_aliases.fish
source $HOME/.local/pipx/venvs/virtualfish/lib/python3.12/site-packages/virtualfish/projects.fish
source $HOME/.local/pipx/venvs/virtualfish/lib/python3.12/site-packages/virtualfish/environment.fish
emit virtualfish_did_setup_plugins