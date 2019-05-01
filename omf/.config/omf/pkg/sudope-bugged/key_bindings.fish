# default key sequence: Ctrl+s
set -q sudope_sequence
  or set -l sudope_sequence \cs

# if sudope is already bound to some sequence, leave it
bind $sudope_sequence sudope
