#!/bin/sh
compton --config $HOME/.config/compton/compton.conf &
# xfce4-power-manager &
# nm-applet 2>&1 > /dev/null &
# volnoti &
# dockerd &
source $HOME/.scripts/ambient.sh &

{%@@ if profile == "MacBookPro" @@%}
source $HOME/.scripts/dwm_statusbar.sh &
touchpad=$(xinput --list | grep bcm5974 | grep -oE 'id=[0-9]+' | cut -d '=' -f2)
xinput set-prop $touchpad 'libinput Natural Scrolling Enabled' 1 &
xinput set-prop $touchpad 'libinput Accel Speed' 0.15 &
xinput set-prop $touchpad 'libinput Tapping Enabled' 1 &
xinput set-prop $touchpad 'libinput Disable While Typing Enabled' 1 &
{%@@ elif profile == "disconnect" @@%}
xrandr --newmode "1920x1200_60.00"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
xrandr --addmode DVI-I-1 1920x1200_60.00
xrandr --output VGA-2 --primary --mode 1440x900 --pos 0x184 --rotate normal --output DVI-I-1 --mode 1920x1200_60.00 --pos 1440x0 --rotate normal --output HDMI-2 --off --output HDMI-1-1 --off --output VGA-1-1 --off
{%@@ endif @@%}
