set -g VIRTUALFISH_VERSION 2.5.5
set -g VIRTUALFISH_PYTHON_EXEC /opt/homebrew/opt/python@3.11/bin/python3.11
source /opt/homebrew/lib/python3.11/site-packages/virtualfish/virtual.fish
source /opt/homebrew/lib/python3.11/site-packages/virtualfish/auto_activation.fish
source /opt/homebrew/lib/python3.11/site-packages/virtualfish/compat_aliases.fish
source /opt/homebrew/lib/python3.11/site-packages/virtualfish/projects.fish
source /opt/homebrew/lib/python3.11/site-packages/virtualfish/environment.fish
emit virtualfish_did_setup_plugins