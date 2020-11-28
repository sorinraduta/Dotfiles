#!/bin/bash

f=/tmp/$(date +%s).png

deepin-screenshot -s $f

cat $f | xclip -selection clipboard -t image/png
