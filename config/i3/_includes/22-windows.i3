# vim: ft=i3
# change focus
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# fix windows to workspace
assign [class="[cC]hromium"] $ws2
assign [class="[fF]irefox"] $ws2
assign [class="[gG]oogle-chrome.*?"] $ws2
assign [class="[Vv]ivaldi.*?"] $ws2

assign [class="[xX]fce4-terminal"] $ws3
assign [class="[kK]onsole"] $ws3
assign [class="U?Rxvt"] $ws3
assign [class="Tilix"] $ws3

assign [class="Vim"] $ws4
assign [class="Gvim"] $ws4
assign [class="Code"] $ws4
assign [class="Atom"] $ws4
assign [class="Subl3"] $ws4
assign [class="[eE]clipse"] $ws4
assign [class="[qQ]t[cC]reator"] $ws4
assign [class="jetbrains-studio"] $ws4

assign [class="Pcmanfm"] $ws5
assign [class="dolphin"] $ws5

assign [class="Gimp-2.10"] $ws6

assign [class="[oO]kular"] $ws7

assign [title="^ncmpcpp.*"] $ws9
assign [class="cantata"] $ws9
assign [class="juk"] $ws9
assign [class="[gG]mpc"] $ws9
assign [class="[lL]ollypop"] $ws9
assign [class="[sS]ayonara"] $ws9
assign [class="[sS]potify"] $ws9

assign [class="[mM]pv"] $ws0

# float all popups
for_window [window_role="pop-up"] floating enable

# floating workspaces
for_window [workspace=$ws1] floating enable
for_window [workspace=$wss9] floating enable

# floating windows
for_window [class="[mM]pv"] floating enable
for_window [class="kcalc"] floating enable
for_window [class="^[vV](lc|LC).*"] floating enable

# borderless window
for_window [class="[gG]oogle-chrome.*?"] border pixel 0
