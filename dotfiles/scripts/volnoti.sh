#!/bin/bash

sink=$(pactl list short sinks | awk '{print $1}')
is_mute=$(pactl list sinks | grep Mute: | sed -e "s/.*: //")
current=$(pactl list sinks | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
perc=${2:-5}

case "$1" in
    up)
        if [[ "yes" == "$is_mute" ]]; then
            pactl set-sink-mute $sink no
        fi
        pactl set-sink-volume $sink +$perc%
        next_perc=$(($current+$perc))
        volnoti-show $next_perc
    ;;
    down)
        pactl set-sink-volume $sink -$perc%
        next_perc=$(($current-$perc))
        volnoti-show $next_perc
    ;;
    mute-toggle)
        pactl set-sink-mute $sink toggle
        if [[ "yes" == "$is_mute" ]]; then
            volnoti-show $current
        else
            volnoti-show -m -0 /usr/share/pixmaps/volnoti/volume_muted.svg
        fi
    ;;
esac
