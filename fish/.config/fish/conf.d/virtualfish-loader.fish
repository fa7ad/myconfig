set -g VIRTUALFISH_VERSION 2.5.1
set -g VIRTUALFISH_PYTHON_EXEC /opt/homebrew/opt/python@3.9/bin/python3.9
source /opt/homebrew/lib/python3.9/site-packages/virtualfish/virtual.fish
source /opt/homebrew/lib/python3.9/site-packages/virtualfish/auto_activation.fish
source /opt/homebrew/lib/python3.9/site-packages/virtualfish/compat_aliases.fish
source /opt/homebrew/lib/python3.9/site-packages/virtualfish/projects.fish
source /opt/homebrew/lib/python3.9/site-packages/virtualfish/environment.fish
emit virtualfish_did_setup_plugins