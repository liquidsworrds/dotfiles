#!/bin/sh

source "$HOME/.zshenv"
nm-applet&
dunst&
sxhkd&
picom&
redshift -P -O 5500
feh --bg-fill $WALL
xinput set-prop 13 314 1
dwmblocks&
