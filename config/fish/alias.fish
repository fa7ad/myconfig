#!/usr/bin/env fish

# MPV
alias mpv=mpvh
alias mpa='mpv --no-vid'

# systemd
alias systop='sudo systemctl stop'
alias systart='sudo systemctl start'
alias syrest='sudo systemctl restart'

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
alias vim_install_packages='vim +BundleInstall! +BundleClean! +q!'

# Pacaur
alias yaconf='pacaur -C'
alias yain='pacaur -S'
alias yains='pacaur -U'
alias yainsd='pacaur -S --asdeps'
alias yaloc='pacaur -Qi'
alias yalocs='pacaur -Qs'
alias yalst='pacaur -Qe'
alias yamir='pacaur -Syy'
alias yaorph='pacaur -Rns (pacaur -Qtdq)'
alias yare='pacaur -Rns'
alias yarem='pacaur -R'
alias yarep='pacaur -Si'
alias yareps='pacaur -Ss'
alias yasu='pacaur -Syu --noconfirm'
alias yaug='pacaur -Su'
alias yaupg='pacaur -Syu --devel'
alias yaupd='pacaur -Sy'

# pip
alias pip3='sudo -H pip3'

# LS
alias l='ls -lFh'
alias la='ll -lAFh'
alias lc='lt -c'
alias lk='ll -Sr'
alias ll='ls -lh'
alias lm='la | $PAGER'
alias ln='nocorrect ln -i'
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
alias g='git'

function git-current-branch
  echo (git branch|grep \* |sed s/\*\ //)
end

alias git='hub'

# Branch (b)
alias gb='git branch'
alias gba='git branch --all --verbose'
alias gbc='git checkout -b'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'
alias gbl='git branch --verbose'
alias gbL='git branch --all --verbose'
alias gbm='git branch --move'
alias gbM='git branch --move --force'
alias gbr='git branch --move'
alias gbR='git branch --move --force'
alias gbs='git show-branch'
alias gbS='git show-branch --all'
alias gbv='git branch --verbose'
alias gbV='git branch --verbose --verbose'
alias gbx='git branch --delete'
alias gbX='git branch --delete --force'

# Commit (c)
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gcm='git commit --message'
alias gcam='git commit --all --message'
alias gco='git checkout'
alias gcO='git checkout --patch'
alias gcf='git commit --amend --reuse-message HEAD'
alias gcF='git commit --verbose --amend'
alias gcp='git cherry-pick --ff'
alias gcP='git cherry-pick --no-commit'
alias gcr='git revert'
alias gcR='git reset "HEAD^"'
alias gcs='git show'
alias gcl='git-commit-lost'

# Conflict (C)
alias gCl='git --no-pager diff --name-only --diff-filter=U'
alias gCa='git add (gCl)'
alias gCe='git mergetool (gCl)'
alias gCo='git checkout --ours --'
alias gCO='gCo (gCl)'
alias gCt='git checkout --theirs --'
alias gCT='gCt (gCl)'

# Data (d)
alias gd='git ls-files'
alias gdc='git ls-files --cached'
alias gdx='git ls-files --deleted'
alias gdm='git ls-files --modified'
alias gdu='git ls-files --other --exclude-standard'
alias gdk='git ls-files --killed'
alias gdi='git status --porcelain --short --ignored | sed -n "s/^!! //p"'

# Fetch (f)
alias gf='git fetch'
alias gfa='git fetch --all'
alias gfc='git clone'
alias gfm='git pull'
alias gfr='git pull --rebase'

# Grep (g)
alias gg='git grep'
alias ggi='git grep --ignore-case'
alias ggl='git grep --files-with-matches'
alias ggL='git grep --files-without-matches'
alias ggv='git grep --invert-match'
alias ggw='git grep --word-regexp'

# Index (i)
alias gia='git add'
alias giA='git add --patch'
alias giu='git add --update'
alias gid='git diff --no-ext-diff --cached'
alias giD='git diff --no-ext-diff --cached --word-diff'
alias gii='git update-index --assume-unchanged'
alias giI='git update-index --no-assume-unchanged'
alias gir='git reset'
alias giR='git reset --patch'
alias gix='git rm -r --cached'
alias giX='git rm -rf --cached'

# Log (l)
alias gl='git log --topo-order --pretty'

# Merge (m)
alias gm='git merge'
alias gmC='git merge --no-commit'
alias gmF='git merge --no-ff'
alias gma='git merge --abort'
alias gmt='git mergetool'

# Push (p)
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpF='git push --force'
alias gpa='git push --all'
alias gpA='git push --all; git push --tags'
alias gpt='git push --tags'
function gpc
  git push --set-upstream origin (git-branch-current)
end

function gpp
  git pull origin (git-branch-current)
  git push origin (git-branch-current)
end

# Rebase (r)
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gri='git rebase --interactive'
alias grs='git rebase --skip'

# Remote (R)
alias gR='git remote'
alias gRl='git remote --verbose'
alias gRa='git remote add'
alias gRx='git remote rm'
alias gRm='git remote rename'
alias gRu='git remote update'
alias gRp='git remote prune'
alias gRs='git remote show'
alias gRb='git-hub-browse'

# Stash (s)
alias gs='git stash'
alias gsa='git stash apply'
alias gsx='git stash drop'
alias gsX='git-stash-clear-interactive'
alias gsl='git stash list'
alias gsL='git-stash-dropped'
alias gsd='git stash show --patch --stat'
alias gsp='git stash pop'
alias gsr='git-stash-recover'
alias gss='git stash save --include-untracked'
alias gsS='git stash save --patch --no-keep-index'
alias gsw='git stash save --include-untracked --keep-index'

# Submodule (S)
alias gS='git submodule'
alias gSa='git submodule add'
alias gSf='git submodule foreach'
alias gSi='git submodule init'
alias gSI='git submodule update --init --recursive'
alias gSl='git submodule status'
alias gSm='git-submodule-move'
alias gSs='git submodule sync'
alias gSu='git submodule foreach git pull origin master'
alias gSx='git-submodule-remove'

# Working Copy (w)
alias gwd='git diff --no-ext-diff'
alias gwD='git diff --no-ext-diff --word-diff'
alias gwr='git reset --soft'
alias gwR='git reset --hard'
alias gwc='git clean -n'
alias gwC='git clean -f'
alias gwx='git rm -r'
alias gwX='git rm -rf'

# My custom aliases
alias gI='git init' # init
alias gaa='git add -A' # add all
alias gis='git status' # status
alias gpv='git push -v' # push verbose
