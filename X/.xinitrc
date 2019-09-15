#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb -merge ~/.Xresources
xmodmap ~/.capstoesc
xinput --set-prop 13 'libinput Accel Speed' -1  
exec i3

