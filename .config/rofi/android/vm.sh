#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme android/seven.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
start="⏻"
shutdown="⭘"
reboot="⏼"
suspend=""

# Variable passed to rofi
options="$start\n$shutdown\n$reboot\n$suspend"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $start)
        sudo virsh start win10q35 && notify-send "Started win10q35"
        ;;
    $shutdown)
        sudo virsh shutdown win10q35 && notify-send "Shutted down win10q35"
        ;;
    $reboot)
        sudo virsh reboot win10q35 && notify-send "Rebooted win10q35"
        ;;
    $suspend)
        sudo virsh managedsave win10q35 && notify-send "Suspended win10q35"
        ;;
esac
