bass source /etc/environment
bass source /etc/profile
bass source $HOME/.bash_profile

# Editors
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less

# ripgrep devs can be dumbasses with their defaults
set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgreprc

set -l local_paths $HOME/.local/bin $HOME/.bin
set -l go_paths $HOME/go/bin
set -l rd_path $HOME/.rd/bin
set -l old_path $PATH $local_paths $go_paths $rd_path

set -l new_path $old_path[1]
set -l fish_new_path

for seg in $old_path
  if __should_add_to_path $seg $fish_new_path
    set fish_new_path $fish_new_path (realpath $seg)
  end
  set bash_path (string split ':' -- $new_path)
  if __should_add_to_path $seg $bash_path
    set new_path "$new_path:"(realpath $seg)
  end
end

set -U fish_user_paths $fish_new_path
set -gx PATH $new_path
