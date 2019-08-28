#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

xrdb -merge ~/.Xresources
xmodmap ~/.capstoesc
exec i3

