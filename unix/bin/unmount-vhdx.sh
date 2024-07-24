#!/bin/bash

MOUNT_POINT="$1"

#unmount & remove nbd module
sudo umount "$MOUNT_POINT" && sudo qemu-nbd -d /dev/nbd0 && sudo rmmod nbd
