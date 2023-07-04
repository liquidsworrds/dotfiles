#!/bin/sh

nm-applet&
dunst&
sxhkd&
picom&
redshift -P -O 5500
feh --bg-fill $WALL
dwmblocks&
