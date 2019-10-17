#!/usr/bin/env fish
# yay
if not set -q yay_aliases
  set -U yay_aliases
  abbr yaconf 'yay -C'
  abbr yain 'yay -S'
  abbr yains 'yay -U'
  abbr yainsd 'yay -S --asdeps'
  abbr yaloc 'yay -Qi'
  abbr yalocs 'yay -Qs'
  abbr yalst 'yay -Qe'
  abbr yamir 'yay -Syy'
  abbr yaorph 'yay -Rns (yay -Qtdq)'
  abbr yare 'yay -Rns'
  abbr yarem 'yay -R'
  abbr yarep 'yay -Si'
  abbr yareps 'yay -Ss'
  abbr yasu 'yay -Syu --noconfirm'
  abbr yaug 'yay -Su'
  abbr yaupg 'yay -Syu --devel'
  abbr yaupd 'yay -Sy'
end
