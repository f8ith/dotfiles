#!/bin/bash

for app_dir in ~/.var/app/*; do
    ln -s ~/.config/fontconfig $app_dir/config/fontconfig
done
