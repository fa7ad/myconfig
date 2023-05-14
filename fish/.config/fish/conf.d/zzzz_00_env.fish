bass eval `/usr/libexec/path_helper -s`
bass source /etc/profile
bass source $HOME/.bash_profile

# Editors
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less

# N
set -gx N_PREFIX /usr/local/n

### BREW
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -gx HOMEBREW_SHELLENV_PREFIX "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
### /BREW

# bun
set -x BUN_INSTALL "$HOME/.bun"

set -l node_paths $N_PREFIX/bin
set -l yarn_paths $HOME/.config/yarn/global/node_modules/.bin
set -l local_paths $HOME/.local/bin $HOME/.bin
set -l gnu_bins (brew --prefix coreutils)/libexec/gnubin
set -l py_paths /Users/fahad/Library/Python/*/bin
set -l ruby_paths (brew --prefix ruby)/bin $HOMEBREW_PREFIX/lib/ruby/gems/*/bin
set -l go_paths $HOME/go/bin
set -l bun_path $BUN_INSTALL/bin
set -l old_path $PATH $ruby_paths $local_paths $go_paths $node_paths $yarn_paths $py_paths $bun_path # $gnu_bins

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
