function pd -d "Search for and jump to a project directory"
  set -l project_roots "$HOME/ghorg" "$HOME/Projects"

  set -l exclude_list vendor/ 'crates/' # 'other stuff'
  set -l fd_args '--exclude='$exclude_list '--type=d' '--maxdepth=5'

  set -l go_to (fd $fd_args . $project_roots | sed -E 's|'$HOME'|~|g' | fzf +i --tiebreak=chunk,end,begin --query "$argv")

  test -n "$go_to" && commandline -r "cd $go_to"
end
