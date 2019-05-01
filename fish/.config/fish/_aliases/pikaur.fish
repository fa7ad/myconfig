#!/usr/bin/env fish
# pikaur
if not set -q pikaur_aliases
  set -U pikaur_aliases
  abbr yaconf 'pikaur -C'
  abbr yain 'pikaur -S'
  abbr yains 'pikaur -U'
  abbr yainsd 'pikaur -S --asdeps'
  abbr yaloc 'pikaur -Qi'
  abbr yalocs 'pikaur -Qs'
  abbr yalst 'pikaur -Qe'
  abbr yamir 'pikaur -Syy'
  abbr yaorph 'pikaur -Rns (pikaur -Qtdq)'
  abbr yare 'pikaur -Rns'
  abbr yarem 'pikaur -R'
  abbr yarep 'pikaur -Si'
  abbr yareps 'pikaur -Ss'
  abbr yasu 'pikaur -Syu --noconfirm'
  abbr yaug 'pikaur -Su'
  abbr yaupg 'pikaur -Syu --devel'
  abbr yaupd 'pikaur -Sy'
end
