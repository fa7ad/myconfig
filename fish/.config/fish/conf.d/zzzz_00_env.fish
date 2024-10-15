bass eval `/usr/libexec/path_helper -s`
bass source /etc/profile
bass source $HOME/.bash_profile

# Editors
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx PAGER less


# ripgrep devs can be dumbasses with their defaults
set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgreprc

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
set -x BUN_INSTALL $HOME/.bun

# python
set -l python_version 3.12

set -l py_aliases (brew --prefix "python@$python_version")/libexec/bin

set -l py_pep668 $HOME/.pep668

set -l yarn_paths $HOME/.yarn/bin $HOME/.config/yarn/global/node_modules/.bin
set -l local_paths $HOME/.local/bin $HOME/.bin
set -l gnu_bins (brew --prefix coreutils)/libexec/gnubin
set -l py_paths $HOME/Library/Python/*/bin $py_aliases $py_pep668/bin
set -l go_paths $HOME/go/bin
set -l bun_path $BUN_INSTALL/bin
set -l rd_path $HOME/.rd/bin
set -l cargo_path $HOME/.cargo/bin
set -l asdf_path $HOME/.asdf/shims
set -l old_path $asdf_path $PATH $local_paths $go_paths $yarn_paths $py_paths $bun_path $rd_path $cargo_path
# $gnu_bins

set -l new_path $old_path[1]
set -l fish_new_path

for seg in $old_path
    if __should_add_to_path $seg $fish_new_path
        set -a fish_new_path (realpath $seg)
    end
    set bash_path (string split ':' -- $new_path)
    if __should_add_to_path $seg $bash_path
        set new_path "$new_path:"(realpath $seg)
    end
end

# prefer homebrew python over system
set new_path "$py_aliases:$new_path"
set -p fish_new_path $py_aliases

set -U fish_user_paths $fish_new_path
set -gx PATH $new_path
