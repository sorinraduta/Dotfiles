#!/bin/bash

current=13
perc=5

next_perc=$(($current + $current%$perc))
echo $next_perc
next_perc=$(($next_perc-$perc))
echo $next_perc