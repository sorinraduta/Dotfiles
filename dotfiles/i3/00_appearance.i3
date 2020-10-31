#     _
#    /_\  _ __ _ __  ___ __ _ _ _ __ _ _ _  __ ___
#   / _ \| '_ \ '_ \/ -_) _` | '_/ _` | ' \/ _/ -_)
#  /_/ \_\ .__/ .__/\___\__,_|_| \__,_|_||_\__\___|
#        |_|  |_|

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block.
font pango:Hack 8

# Widow colors
# class                 border  bground text    indicator child_border
client.focused          #6272A4 #6272A4 #F8F8F2 #6272A4   #6272A4
client.focused_inactive #44475A #44475A #F8F8F2 #44475A   #44475A
client.unfocused        #282A36 #282A36 #BFBFBF #282A36   #282A36
client.urgent           #44475A #FF5555 #F8F8F2 #FF5555   #FF5555
client.placeholder      #282A36 #282A36 #F8F8F2 #282A36   #282A36

client.background       #F8F8F2

# Borders
default_border pixel 1
default_border normal 1
hide_edge_borders both

# Hide title
new_window 1pixel
for_window [class="^.*"] border pixel 2

# Gaps
gaps inner 10
smart_gaps on
smart_borders on
