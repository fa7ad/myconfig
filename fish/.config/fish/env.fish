# env stuff goes here
bass source /etc/environment
bass source /etc/profile

# Editors
set -gx EDITOR vim
set -gx VISUAL vim
set -gx PAGER less

# Add to PATH
set -l ruby_paths (string split \  $HOME/.gem/ruby/*/bin)
set -l user_paths $HOME/.bin $HOME/.local/bin
set -l node_paths $N_PREFIX/bin
set -gx PATH $PATH $user_paths $ruby_paths $node_paths
vardedupe PATH
set -U fish_user_paths $PATH
