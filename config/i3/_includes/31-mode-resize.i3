# vim: ft=i3
# Resize Mode
set $mode_resize "Resize: ⇧ Shrink (V) | ⇩ Grow (V) | ⇨ Grow (H) | ⇦ Shrink (H)"

mode $mode_resize {
  bindsym Left  resize shrink width 10 px or 5 ppt
  bindsym Down  resize grow height 10 px or 5 ppt
  bindsym Up    resize shrink height 10 px or 5 ppt
  bindsym Right resize grow width 10 px or 5 ppt

  bindsym Return mode "default"
  bindsym Escape mode "default"
}
bindsym $mod+r mode $mode_resize
