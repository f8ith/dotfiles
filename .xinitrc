#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
[ -f "$HOME/.xprofile" ] && . ~/.xprofile

## GNOME
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
dbus-update-activation-environment --systemd DISPLAY

export IMSETTINGS_MODULE=fcitx5
export INPUT_METHOD=fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export GLFW_IM_MODULE=ibus
export XMODIFIERS=@im=fcitx5

#export DESKTOP_SESSION=plasma
#exec gnome-session
#exec startplasma-x11
exec bspwm
