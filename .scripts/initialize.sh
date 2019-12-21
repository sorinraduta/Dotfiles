#!/bin/bash

# Run scripts
source $HOME/.scripts/screenlayout.sh &
source $HOME/.scripts/wallpaper.sh &
source $HOME/.scripts/lockscreen.sh &
source $HOME/.scripts/polybar.sh &

# Start programs
crontab $HOME/.cronjobs
compton -b -c --paint-on-overlay --respect-prop-shadow --config $HOME/.config/compton/compton.conf &
# xfce4-power-manager &
# nm-applet 2>&1 > /dev/null &
# volnoti &

# Merge i3config modules
cat ~/.config/i3/modules/*.i3config > ~/.config/i3/config

# Increase max watchers value
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
