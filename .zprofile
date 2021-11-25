# if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#   startx
# fi

#export CLUTTER_BACKEND=wayland
#export SDL_VIDEODRIVER=wayland
#export XDG_SESSION_TYPE=wayland
#export QT_QPA_PLATFORM=wayland
#export QT_WAYLAND_DISABLE_WINDOWDEORATION=1
#export MOZ_ENABLE_WAYLAND=1
#export GBM_BACKEND=nvidia-drm
#export __GLX_VENDOR_LIBRARY_NAME=nvidia 
#export WLR_NO_HARDWARE_CURSORS=1
