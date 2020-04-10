#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme android/five.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="⭘"
reboot="⏼"
lock=""
suspend=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl shutdown
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        betterlockscreen -l
        ;;
    $suspend)
        sudo virsh managedsave win10q35
        systemctl suspend
        betterlockscreen -l
        ;;
    $logout)
        bspc quit
        ;;
esac

