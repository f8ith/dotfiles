#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
[ -f "$HOME/.xprofile" ] && . ~/.xprofile

exec awesome

