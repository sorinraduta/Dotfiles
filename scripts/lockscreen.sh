#!/bin/bash

lockscreens_dir=/home/rappy/.wallpapers
used_lockscreens_file=/home/rappy/.cache/.used_lockscreens

cd $lockscreens_dir

lockscreens=($(find ${lockscreens_dir} -name '*.jpg' -o -name '*.png' -o -name '*.gif'))
num_lockscreens=${#lockscreens[*]}
mapfile -t used_lockscreens < $used_lockscreens_file

for run in {1..100}
do
    i=$(($RANDOM%num_lockscreens))
    random_lockscreen=${lockscreens[$i]}
    if [[ ! " ${used_lockscreens[@]} " =~ " ${random_lockscreen} " ]];
    then
        break
    fi
done

echo $random_lockscreen >> $used_lockscreens_file
cp $random_lockscreen /home/rappy/.lockscreen.
mogrify -format png /home/rappy/.lockscreen.
