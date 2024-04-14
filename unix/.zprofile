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

##
# Your previous /Users/faith/.zprofile file was backed up as /Users/faith/.zprofile.macports-saved_2023-11-25_at_12:34:07
##

# MacPorts Installer addition on 2023-11-25_at_12:34:07: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

