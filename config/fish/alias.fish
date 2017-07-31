#!/usr/bin/env fish

# MPV
alias mpv mpvh
alias mpa 'mpv --no-vid'

# systemd
abbr systop 'sudo systemctl stop'
abbr systart 'sudo systemctl start'
abbr syrest 'sudo systemctl restart'

# irssi
alias irssi='screen irssi'

# tree
alias tree='tree -I "node_modules|bower_components"'

# gitignore
function gign
  echo $argv >> .gitignore
end

# update_config
function update_config
  set curr (pwd)
  cd $HOME/myconfig
  git pull -X theirs
  rsync -ar config/ $HOME/.config/
  cd $cur
end

# passwordless sudo
function getsudo
  echo $MYPASSWORD_CLEARTEXT | sudo -S echo 'Got SUDO!'
end

# vim
alias vim_clear_cache='rm -rf ~/.vim{backup,swap,undo,views}'

# Obvious short hands
alias cls='clear'
abbr sshx 'ssh -X'
function mkcd
  mkdir -p $argv
  cd $argv
end

# Pacaur
if not set -q pacaur_aliases
  set -U pacaur_aliases
  abbr yaconf 'pacaur -C'
  abbr yain 'pacaur -S'
  abbr yains 'pacaur -U'
  abbr yainsd 'pacaur -S --asdeps'
  abbr yaloc 'pacaur -Qi'
  abbr yalocs 'pacaur -Qs'
  abbr yalst 'pacaur -Qe'
  abbr yamir 'pacaur -Syy'
  abbr yaorph 'pacaur -Rns (pacaur -Qtdq)'
  abbr yare 'pacaur -Rns'
  abbr yarem 'pacaur -R'
  abbr yarep 'pacaur -Si'
  abbr yareps 'pacaur -Ss'
  abbr yasu 'pacaur -Syu --noconfirm'
  abbr yaug 'pacaur -Su'
  abbr yaupg 'pacaur -Syu --devel'
  abbr yaupd 'pacaur -Sy'
end

# pip
alias pip3='sudo -H pip3'

# LS
alias l='ls -lFh'
alias la='ll -lAFh'
alias lc='lt -c'
alias lk='ll -Sr'
alias ll='ls -lh'
alias lm='la | $PAGER'
alias lr='ll -tRFh'
alias ls='ls --group-directories-first --color=auto'
alias lsa='ls -lah'
alias lt='ll -tr'
alias lu='lt -u'
alias lx='ll -XB'

#
# Defines Git aliases.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Git
function git-current-branch
  echo (git branch|grep \* |sed s/\*\ //)
end

alias git hub

if not set -q git_aliases_set
  set -U git_aliases_set
  abbr g git
  # Branch (b)
  abbr gb 'git branch'
  abbr gba 'git branch --all --verbose'
  abbr gbc 'git checkout -b'
  abbr gbd 'git branch --delete'
  abbr gbD 'git branch --delete --force'
  abbr gbl 'git branch --verbose'
  abbr gbL 'git branch --all --verbose'
  abbr gbm 'git branch --move'
  abbr gbM 'git branch --move --force'
  abbr gbr 'git branch --move'
  abbr gbR 'git branch --move --force'
  abbr gbs 'git show-branch'
  abbr gbS 'git show-branch --all'
  abbr gbv 'git branch --verbose'
  abbr gbV 'git branch --verbose --verbose'
  abbr gbx 'git branch --delete'
  abbr gbX 'git branch --delete --force'

  # Commit (c)
  abbr gc 'git commit --verbose'
  abbr gca 'git commit --verbose --all'
  abbr gcm 'git commit --message'
  abbr gcam 'git commit --all --message'
  abbr gco 'git checkout'
  abbr gcO 'git checkout --patch'
  abbr gcf 'git commit --amend --reuse-message HEAD'
  abbr gcF 'git commit --verbose --amend'
  abbr gcp 'git cherry-pick --ff'
  abbr gcP 'git cherry-pick --no-commit'
  abbr gcr 'git revert'
  abbr gcR 'git reset "HEAD^"'
  abbr gcs 'git show'
  abbr gcl 'git-commit-lost'

  # Conflict (C)
  abbr gCl 'git --no-pager diff --name-only --diff-filter=U'
  abbr gCa 'git add (gCl)'
  abbr gCe 'git mergetool (gCl)'
  abbr gCo 'git checkout --ours --'
  abbr gCO 'gCo (gCl)'
  abbr gCt 'git checkout --theirs --'
  abbr gCT 'gCt (gCl)'

  # Data (d)
  abbr gd 'git ls-files'
  abbr gdc 'git ls-files --cached'
  abbr gdx 'git ls-files --deleted'
  abbr gdm 'git ls-files --modified'
  abbr gdu 'git ls-files --other --exclude-standard'
  abbr gdk 'git ls-files --killed'
  abbr gdi 'git status --porcelain --short --ignored | sed -n "s/^!! //p"'

  # Fetch (f)
  abbr gf 'git fetch'
  abbr gfa 'git fetch --all'
  abbr gfc 'git clone'
  abbr gfm 'git pull'
  abbr gfr 'git pull --rebase'

  # Grep (g)
  abbr gg 'git grep'
  abbr ggi 'git grep --ignore-case'
  abbr ggl 'git grep --files-with-matches'
  abbr ggL 'git grep --files-without-matches'
  abbr ggv 'git grep --invert-match'
  abbr ggw 'git grep --word-regexp'

  # Index (i)
  abbr gia 'git add'
  abbr giA 'git add --patch'
  abbr giu 'git add --update'
  abbr gid 'git diff --no-ext-diff --cached'
  abbr giD 'git diff --no-ext-diff --cached --word-diff'
  abbr gii 'git update-index --assume-unchanged'
  abbr giI 'git update-index --no-assume-unchanged'
  abbr gir 'git reset'
  abbr giR 'git reset --patch'
  abbr gix 'git rm -r --cached'
  abbr giX 'git rm -rf --cached'

  # Log (l)
  abbr gl 'git log --topo-order --pretty'

  # Merge (m)
  abbr gm 'git merge'
  abbr gmC 'git merge --no-commit'
  abbr gmF 'git merge --no-ff'
  abbr gma 'git merge --abort'
  abbr gmt 'git mergetool'

  # Push (p)
  abbr gp 'git push'
  abbr gpf 'git push --force-with-lease'
  abbr gpF 'git push --force'
  abbr gpa 'git push --all'
  abbr gpA 'git push --all; git push --tags'
  abbr gpt 'git push --tags'
  abbr gpc 'git push --set-upstream origin (git-branch-current)'

  function gpp
    git pull origin (git-branch-current)
    git push origin (git-branch-current)
  end

  # Rebase (r)
  abbr gr 'git rebase'
  abbr gra 'git rebase --abort'
  abbr grc 'git rebase --continue'
  abbr gri 'git rebase --interactive'
  abbr grs 'git rebase --skip'

  # Remote (R)
  abbr gR 'git remote'
  abbr gRl 'git remote --verbose'
  abbr gRa 'git remote add'
  abbr gRx 'git remote rm'
  abbr gRm 'git remote rename'
  abbr gRu 'git remote update'
  abbr gRp 'git remote prune'
  abbr gRs 'git remote show'
  abbr gRb 'git-hub-browse'

  # Stash (s)
  abbr gs 'git stash'
  abbr gsa 'git stash apply'
  abbr gsx 'git stash drop'
  abbr gsX 'git-stash-clear-interactive'
  abbr gsl 'git stash list'
  abbr gsL 'git-stash-dropped'
  abbr gsd 'git stash show --patch --stat'
  abbr gsp 'git stash pop'
  abbr gsr 'git-stash-recover'
  abbr gss 'git stash save --include-untracked'
  abbr gsS 'git stash save --patch --no-keep-index'
  abbr gsw 'git stash save --include-untracked --keep-index'

  # Submodule (S)
  abbr gS 'git submodule'
  abbr gSa 'git submodule add'
  abbr gSf 'git submodule foreach'
  abbr gSi 'git submodule init'
  abbr gSI 'git submodule update --init --recursive'
  abbr gSl 'git submodule status'
  abbr gSm 'git-submodule-move'
  abbr gSs 'git submodule sync'
  abbr gSu 'git submodule foreach git pull origin master'
  abbr gSx 'git-submodule-remove'

  # Working Copy (w)
  abbr gwd 'git diff --no-ext-diff'
  abbr gwD 'git diff --no-ext-diff --word-diff'
  abbr gwr 'git reset --soft'
  abbr gwR 'git reset --hard'
  abbr gwc 'git clean -n'
  abbr gwC 'git clean -f'
  abbr gwx 'git rm -r'
  abbr gwX 'git rm -rf'

  # My custom aliases
  abbr gI 'git init'
  abbr gaa 'git add -A'
  abbr gis 'git status'
  abbr gpv 'git push -v'
end
