export ELECTRON_OZONE_PLATFORM_HINT="auto"

# Default Programs

export EDITOR="nvim"
export TERMINAL="wezterm"
export BROWSER="brave"
export READER="zathura"

# Fcitx settings
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export XDG_CONFIG_HOME="$HOME/.config"
#export GTK_IM_MODULE=fcitx
export QT_IM_MODULES="wayland;fcitx;ibus"
export XMODIFIERS=@im=fcitx

export SYSTEM_TYPE=$(uname -s)
export PATH="$HOME/bin:$HOME/go/bin/:$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
export GRIMSHOT_FILENAME_FORMAT="$(date +'%Y.%m.%d-%H.%m.%S')"

source ~/.local.profile
