# Start i3bar 
bar {
  tray_output primary
  font pango:Overpass 10, pango:FontAwesome 10
  colors {
    background $bg-color
    statusline #00A5FF
    separator #757575
    #                  border             background         text
    focused_workspace  $bg-color          $bg-color          $text-color
    inactive_workspace $inactive-bg-color $inactive-bg-color $inactive-text-color
    urgent_workspace   $urgent-bg-color   $urgent-bg-color   $text-color
  }
  status_command i3blocks -c ~/.config/i3/i3blocks.conf
}