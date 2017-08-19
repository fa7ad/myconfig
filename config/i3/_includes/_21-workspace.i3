set $ws1 "1: "
set $ws2 "2: "
set $ws3 "3: "
set $ws4 "4: "
set $ws5 "5: "
set $ws6 "6: ?"
set $ws7 "7: ?"
set $ws8 "9: ?"
set $ws9 "9: ?"
set $ws0 "10: "

# Secret workspaces
set $wss0 " 0"
set $wss1 " 1"
set $wss2 " 2"
set $wss3 " 3"
set $wss4 " 4"
set $wss5 " 5"
set $wss6 " 6"
set $wss7 " 7"
set $wss8 " 8"
set $wss9 " 9"

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws0

bindsym $mod+KP_1 workspace $wss1
bindsym $mod+KP_2 workspace $wss2
bindsym $mod+KP_3 workspace $wss3
bindsym $mod+KP_4 workspace $wss4
bindsym $mod+KP_5 workspace $wss5
bindsym $mod+KP_6 workspace $wss6
bindsym $mod+KP_7 workspace $wss7
bindsym $mod+KP_8 workspace $wss8
bindsym $mod+KP_9 workspace $wss9
bindsym $mod+KP_0 workspace $wss0

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws0

bindsym $mod+Shift+KP_1 move container to workspace $wss1
bindsym $mod+Shift+KP_2 move container to workspace $wss2
bindsym $mod+Shift+KP_3 move container to workspace $wss3
bindsym $mod+Shift+KP_4 move container to workspace $wss4
bindsym $mod+Shift+KP_5 move container to workspace $wss5
bindsym $mod+Shift+KP_6 move container to workspace $wss6
bindsym $mod+Shift+KP_7 move container to workspace $wss7
bindsym $mod+Shift+KP_8 move container to workspace $wss8
bindsym $mod+Shift+KP_9 move container to workspace $wss9
bindsym $mod+Shift+KP_0 move container to workspace $wss0
