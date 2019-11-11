#!/bin/bash

f=/tmp/$(date +%s).png

# maim -s $f
deepin-screenshot -s $f

cat $f | xclip -selection clipboard -t image/png