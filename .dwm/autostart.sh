#!/bin/bash

id=$(xinput list | grep "Touchpad" | awk '{print $6}' | cut -d'=' -f2)
source "$HOME/.zshenv"
nm-applet&
dunst&
sxhkd&
/usr/local/bin/picom&
dwmblocks&
redshift -P -O 5500
feh --bg-fill "$WALL"
xinput set-prop "$id" "libinput Tapping Enabled" 1
