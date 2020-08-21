#!/bin/sh

setxkbmap -option caps:escape &
xinput --set-prop  'pointer:Logitech G703' 'libinput Accel Speed' -0.5 &
