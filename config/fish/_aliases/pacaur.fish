#!/usr/bin/env fish
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
