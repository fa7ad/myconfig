# name: clear
# ---------------
# Based on idan. Display the following bits on the left:
# - Current directory name
# - Git branch and dirty state (if inside a git repo)

function _git_branch_name
  echo (git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
  echo (git status -s --ignore-submodules=dirty ^/dev/null)
end

function _git_has_upstream
  echo (git rev-parse --abbrev-ref '@{upstream}' ^/dev/null)
end

function _git_rev_list
  echo (git rev-list --left-right --count 'HEAD...@{upstream}' ^/dev/null)
end

function fish_prompt
  set -l last_status $status

  set -l cyan (set_color cyan)
  set -l yellow (set_color yellow)
  set -l red (set_color red)
  set -l blue (set_color blue)
  set -l green (set_color green)
  set -l normal (set_color normal)

  set -l cwd $blue(pwd | sed "s:^$HOME:~:")

  # Output the prompt, left to right

  # Add a newline before new prompts
  echo -e ''

  # Print pwd or full path
  echo -n -s $cwd $normal

  # Show git branch and status
  if test (_git_branch_name)
    set -l git_branch (_git_branch_name)
    set git_info '('

    if test (_git_is_dirty)
      set git_info $git_info $yellow $git_branch "*" $normal
    else
      set git_info $git_info $green $git_branch $normal
    end

    if test (_git_has_upstream)
      _git_rev_list | read -la git_status

      set -l left $git_status[1]
      set -l right $git_status[2]

      if test $left != 0
        set git_arrows "⇡"
      end

      if test $right != 0
        set git_arrows "$git_arrows⇣"
      end
      set git_info $git_info $yellow $git_arrows $normal
    end
    set git_info $git_info ')'

    echo -n -s ' · ' $git_info $normal
  end

  set -l prompt_color $red
  if test $last_status = 0
    set prompt_color $normal
  end

  # Terminate with a nice prompt char
  echo -e ''
  echo -e -n -s $prompt_color '⟩ ' $normal
end
