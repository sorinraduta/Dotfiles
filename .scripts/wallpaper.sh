#!/bin/bash
wallpapers_dir=$HOME/.wallpapers
used_wallpapers_file=$HOME/.cache/.used_wallpapers

cd $wallpapers_dir

wallpapers=($(find ${wallpapers_dir} -name '*.jpg' -o -name '*.png' -o -name '*.gif'))
num_wallpapers=${#wallpapers[*]}
mapfile -t used_wallpapers < $used_wallpapers_file

for run in {1..100}
do
    i=$(($RANDOM%num_wallpapers))
    random_wallpaper=${wallpapers[$i]}
    if [[ ! " ${used_wallpapers[@]} " =~ " ${random_wallpaper} " ]];
    then
        break
    fi
done

echo $random_wallpaper >> $used_wallpapers_file

feh --bg-fill $random_wallpaper
