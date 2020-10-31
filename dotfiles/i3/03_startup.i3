#   ___ _            _
#  / __| |_ __ _ _ _| |_ _  _ _ __
#  \__ \  _/ _` | '_|  _| || | '_ \
#  |___/\__\__,_|_|  \__|\_,_| .__/
#                            |_|


# exec --no-startup-id $HOME/.scripts/display-setup.sh
exec --no-startup-id $HOME/.scripts/wallpaper.sh
exec --no-startup-id $HOME/.scripts/lockscreen.sh
exec --no-startup-id polybar top
exec --no-startup-id polybar bottom

# Programs
exec --no-startup-id compton -b -c --paint-on-overlay --respect-prop-shadow --config $HOME/.config/compton/compton.conf
exec --no-startup-id volnoti
exec --no-startup-id redshift -o
exec --no-startup-id light-locker
# exec --no-startup-id xfce4-power-manager &
# exec --no-startup-id nm-applet 2>&1 > /dev/null &
