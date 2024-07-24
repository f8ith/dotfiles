#!/bin/bash

VHDX_IMG="$1"
MOUNT_POINT="$2"

# [ubuntu] How do you mount a VHD image
# https://ubuntuforums.org/showthread.php?t=2299701
#

# Load the nbd kernel module.
sudo rmmod nbd;sudo modprobe nbd max_part=16

# mount block device
sudo qemu-nbd -c /dev/nbd0 "$VHDX_IMG"

# reload partition table
sudo partprobe /dev/nbd0

# mount partition
sudo mount -o rw,nouser /dev/nbd0 "$MOUNT_POINT"
