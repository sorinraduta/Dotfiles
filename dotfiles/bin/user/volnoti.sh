#!/bin/bash

sink=$(pactl list short sinks | awk '{ if ( $2 == "{{@@ volume_sink @@}}" ) { print $1 } }')
is_mute=$(pactl list sinks | grep -B 10 "{{@@ volume_sink @@}}" | grep Mute: | sed -e "s/.*: //")
current=$(pactl list sinks | grep -B 10 "{{@@ volume_sink @@}}" | grep '^[[:space:]]Volume:' | \
    head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
perc=${2:-5}

case "$1" in
    up)
        if [[ "$is_mute" == "yes" ]]; then
            pactl set-sink-mute $sink no
        fi
        next_perc=$(($current+$perc))
        if [[ $next_perc -gt 100 ]]; then
            next_perc=100
        fi
        pactl set-sink-volume $sink ${next_perc}%
        volnoti-show $next_perc
    ;;
    down)
        next_perc=$(($current-$perc))
        if [[ $next_perc -lt 0 ]]; then
            next_perc=0
        fi
        pactl set-sink-volume $sink ${next_perc}%
        volnoti-show $next_perc
    ;;
    mute-toggle)
        pactl set-sink-mute $sink toggle
        if [[ "$is_mute" == "yes" ]]; then
            volnoti-show $current
        else
            volnoti-show -m
        fi
    ;;
esac
