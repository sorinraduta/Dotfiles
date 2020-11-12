################################################################################
##  Startup                                                                   ##
################################################################################          

# Ambient
exec --no-startup-id $HOME/.scripts/wallpaper.sh
exec --no-startup-id $HOME/.scripts/lockscreen.sh
exec --no-startup-id polybar top
exec --no-startup-id polybar bottom

# Programs
# TODO: make services
exec --no-startup-id picom -b -c --config $HOME/.config/picom/picom.conf
exec --no-startup-id volnoti
exec --no-startup-id redshift
exec --no-startup-id light-locker
# exec --no-startup-id xfce4-power-manager &
# exec --no-startup-id nm-applet 2>&1 > /dev/null &
