#!/bin/sh
# compton --config $HOME/.config/compton/compton.conf &
compton -b -c --paint-on-overlay --respect-prop-shadow --config $HOME/.config/compton/compton.conf &
# xfce4-power-manager &
# nm-applet 2>&1 > /dev/null &
# volnoti &
# dockerd &
source $HOME/.scripts/ambient.sh &
source $HOME/.scripts/screenlayout.sh &
source $HOME/.scripts/statusbar.sh &

xautolock -time 10 -locker "i3lock -t -i /home/rappy/.lockscreen.png" &
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
