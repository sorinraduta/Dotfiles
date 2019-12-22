{%@@ if profile == "disconnect" @@%}
xrandr --newmode "1920x1200_60.00"  193.25  1920 2056 2256 2592  1200 1203 1209 1245 -hsync +vsync
xrandr --addmode DVI-I-1 1920x1200_60.00
xrandr --output VGA-2 --mode 1440x900 --pos 0x184 --rotate normal --output DVI-I-1 --primary --mode 1920x1200_60.00 --pos 1440x0 --rotate normal --output HDMI-2 --off --output HDMI-1-1 --off --output VGA-1-1 --off
{%@@ elif profile == "work" @@%}
xrandr --output DisplayPort-0 --mode 1920x1080 --pos 0x420 --rotate normal --output HDMI-0 --mode 1920x1080 --pos 1920x0 --rotate right --output DVI-0 --off --output DVI-1 --off
{%@@ endif @@%}
