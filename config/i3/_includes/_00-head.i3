#  _  _____                                  
# (_)|___ /          __ _   __ _  _ __   ___ 
# | |  |_ \  _____  / _` | / _` || '_ \ / __|
# | | ___) ||_____|| (_| || (_| || |_) |\__ \
# |_||____/         \__, | \__,_|| .__/ |___/
#                   |___/        |_|         
#____________________________________________
#                __       ______          _  
#     ____      / _|     |____  |        | | 
#    / __ \    | |_  __ _    / /__ _   __| | 
#   / / _` |   |  _|/ _` |  / // _` | / _` | 
#  | | (_| |   | | | (_| | / /| (_| || (_| | 
#   \ \__,_|   |_|  \__,_|/_/  \__,_| \__,_| 
#    \____/                                  
#                                            
# vim: ft=i3
# Window key
set $mod Mod4
set $alt Mod1

# set locker command
set $locker ~/.bin/lock.sh

# set file manager
set $file_man nautilus

# Used for moving floating windows around
floating_modifier $mod

# focus behaviour
focus_follows_mouse no
mouse_warping none