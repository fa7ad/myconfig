# Font
font pango:Overpass 10

# Colors
set $bg-color              #2f343f
set $inactive-bg-color     #363846
set $text-color            #f3f4f5
set $inactive-text-color   #676E7D
set $urgent-bg-color       #E53935

# window colors
#                       border              background         text                 indicator
client.focused          $bg-color           $bg-color          $text-color          #ff0000
client.unfocused        $inactive-bg-color  $inactive-bg-color $inactive-text-color #ff0000
client.focused_inactive $inactive-bg-color  $inactive-bg-color $inactive-text-color #ff0000
client.urgent           $urgent-bg-color    $urgent-bg-color   $text-color          #ff0000

# Hide borders
hide_edge_borders both

# set Gaps
gaps inner 5
gaps outer 0
smart_gaps on