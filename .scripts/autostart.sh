#!/bin/sh
compton --config $HOME/.config/compton/compton.conf &
xautolock -time 10 -locker "i3lock -t -i /home/rappy/.lockscreen.png" &
# xfce4-power-manager &
# nm-applet 2>&1 > /dev/null &
# volnoti &
# dockerd &
source $HOME/.scripts/ambient.sh &
source $HOME/.scripts/screenlayout.sh &