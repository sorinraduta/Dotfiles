#!/bin/bash

wallpapers_dir=$HOME/.local/share/backgrounds
used_wallpapers_file=$HOME/.cache/wallpapers

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

for run in {1..100}
do
    i=$(($RANDOM%num_wallpapers))
    random_wallpaper2=${wallpapers[$i]}
    if [[ ! " ${used_wallpapers[@]} " =~ " ${random_wallpaper2} " ]];
    then
        break
    fi
done

echo $random_wallpaper >> $used_wallpapers_file
echo $random_wallpaper2 >> $used_wallpapers_file

feh --bg-fill $random_wallpaper $random_wallpaper2
