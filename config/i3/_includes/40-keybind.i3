# vim: ft=i3
# start a terminal
bindsym $mod+Return exec i3-sensible-terminal

# kill focused window
bindsym $mod+Shift+q kill

# split in horizontal orientation
bindsym $mod+h split h
# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle
#toggle borderless
bindsym $mod+b border toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split
# toggle tiling / floating
bindsym $mod+Shift+space floating toggle
# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# # focus the parent container
# bindsym $mod+a focus parent
# # focus the child container
# bindsym $mod+d focus child

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3
bindsym $mod+Shift+r restart
# exit i3
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'Do you really want to exit i3?' -b 'Yes!' 'i3-msg exit'"

# Lock using Mod+l
bindsym --release $mod+l exec xset dpms force off

# Open File Manager
bindsym $mod+$alt+e exec $file_man

# Pulse Audio controls
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5%
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5%

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 20
bindsym XF86MonBrightnessDown exec xbacklight -dec 20

# Sleep
bindsym XF86Sleep exec xset dpms force suspend
bindsym XF86PowerOff exec xset dpms force suspend

# Touchpad controls
bindsym XF86TouchpadToggle exec ~/.bin/toggletouchpad.sh

# Media player controls
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioStop exec playerctl stop
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# Screenshot
# bindsym --release Print exec scrot -q 100 'shot_%Y-%m-%d_%H%M%S.jpg' -e 'mv $f ~/Pictures/'
# bindsym --release Shift+Print exec scrot -s -q 100 'shot_%Y-%m-%d_%H%M%S.jpg' -e 'mv $f ~/Pictures/'
# bindsym --release $mod+Print exec scrot -u -q 100 'shot_%Y-%m-%d_%H%M%S.jpg' -e 'mv $f ~/Pictures/'
bindsym --release Print exec i3-scrot -d
bindsym --release Shift+Print exec i3-scrot -s
bindsym --release $alt+Print exec i3-scrot -w

# show albert
bindsym $mod+d exec albert toggle
