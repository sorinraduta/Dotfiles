#!/bin/bash

wallpapers_dir=$HOME/.wallpapers

cd $wallpapers_dir

wallpapers=($(find ${wallpapers_dir} -name *.jpg -o -name *.png -o -name *.gif))
num_wallpapers=${#wallpapers[*]}
rand=$(date +%Y%m%d)
i=$((rand%num_wallpapers))

random_wallpaper=$wallpapers_dir/${wallpapers[$i]}

wal -i $random_wallpaper
feh --bg-fill $random_wallpaper
xrdb -merge $HOME/.cache/wal/colors.dwm.Xresources
xdotool key Super_L+Escape x r d b ctrl+i