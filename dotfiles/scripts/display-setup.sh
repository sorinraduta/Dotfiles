#!/bin/bash

# TODO: switch display_layout
xrandr --newmode "1920x1200_60.00"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
xrandr --addmode DVI-0 1920x1200_60.00
xrandr --output DVI-0 --primary --mode 1920x1200_60.00 --pos 1080x635 --rotate normal \
--output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate left \
--output DVI-1 --off \
--output DisplayPort-0 --off

# xrandr --output DP-1 --mode 1920x1080 --pos 0x420 --rotate normal \
# --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate right \
# --output DVI-I-1 --off \
# --output DVI-D-1 --off
