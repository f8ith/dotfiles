#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme android/five.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot="⏼"
lock=""
suspend=""
hibernate=""
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$hibernate\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        sudo systemctl shutdown
        ;;
    $reboot)
        sudo systemctl reboot
        ;;
    $lock)
        betterlockscreen -l
        ;;
    $suspend)
        sudo virsh managedsave win10q35
        sudo systemctl suspend
        betterlockscreen -l
        ;;
    $hibernate)
        sudo virsh managedsave win10q35
        sudo systemctl hibernate
        ;;
    $logout)
        bspc quit
        ;;
esac

