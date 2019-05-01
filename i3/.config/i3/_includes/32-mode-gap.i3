# vim: ft=i3
# Gap change mode
set $mode_gaps "Gaps: (o) outer, (i) inner"
set $mode_gaps_outer "Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)"
set $mode_gaps_inner "Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)"

bindsym $mod+g mode $mode_gaps

mode $mode_gaps {
  bindsym o      mode $mode_gaps_outer
  bindsym i      mode $mode_gaps_inner
  bindsym Return mode "default"
  bindsym Escape mode "default"
}

mode $mode_gaps_inner {
  bindsym plus  gaps inner current plus 5
  bindsym minus gaps inner current minus 5
  bindsym 0     gaps inner current set 0
  bindsym KP_Add      gaps inner current plus 5
  bindsym KP_Subtract gaps inner current minus 5
  bindsym KP_0        gaps inner current set 0

  bindsym Shift+plus  gaps inner all plus 5
  bindsym Shift+minus gaps inner all minus 5
  bindsym Shift+0     gaps inner all set 0
  bindsym Shift+KP_Add      gaps inner all plus 5
  bindsym Shift+KP_Subtract gaps inner all minus 5
  bindsym Shift+KP_0        gaps inner all set 0

  bindsym Return mode "default"
  bindsym Escape mode "default"
}

mode $mode_gaps_outer {
  bindsym plus  gaps outer current plus 5
  bindsym minus gaps outer current minus 5
  bindsym 0     gaps outer current set 0
  bindsym KP_Add      gaps outer current plus 5
  bindsym KP_Subtract gaps outer current minus 5
  bindsym KP_0        gaps outer current set 0

  bindsym Shift+plus  gaps outer all plus 5
  bindsym Shift+minus gaps outer all minus 5
  bindsym Shift+0     gaps outer all set 0
  bindsym Shift+KP_Add      gaps outer all plus 5
  bindsym Shift+KP_Subtract gaps outer all minus 5
  bindsym Shift+KP_0        gaps outer all set 0

  bindsym Return mode "default"
  bindsym Escape mode "default"
}
