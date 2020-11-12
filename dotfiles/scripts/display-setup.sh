#!/bin/bash

# TODO: switch display_layout
xrandr --newmode "1920x1200_60.00"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
xrandr --addmode {{@@ main_monitor @@}} 1920x1200_60.00
xrandr --output {{@@ main_monitor @@}} --primary --mode 1920x1200_60.00 --pos 1080x635 --rotate normal \
--output {{@@ secondary_monitor @@}} --mode 1920x1080 --pos 0x0 --rotate left
