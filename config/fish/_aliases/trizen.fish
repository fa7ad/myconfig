#!/usr/bin/env fish
# trizen
if not set -q trizen_aliases
  set -U trizen_aliases
  abbr yaconf 'trizen -C'
  abbr yain 'trizen -S'
  abbr yains 'trizen -U'
  abbr yainsd 'trizen -S --asdeps'
  abbr yaloc 'trizen -Qi'
  abbr yalocs 'trizen -Qs'
  abbr yalst 'trizen -Qe'
  abbr yamir 'trizen -Syy'
  abbr yaorph 'trizen -Rns (trizen -Qtdq)'
  abbr yare 'trizen -Rns'
  abbr yarem 'trizen -R'
  abbr yarep 'trizen -Si'
  abbr yareps 'trizen -Ss'
  abbr yasu 'trizen -Syu --noconfirm'
  abbr yaug 'trizen -Su'
  abbr yaupg 'trizen -Syu --devel'
  abbr yaupd 'trizen -Sy'
end
