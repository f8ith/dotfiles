export EDITOR=/usr/bin/nvim
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export XDG_CONFIG_HOME="$HOME/.config"
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export BROWSER=/usr/bin/chromium
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
    export ZPLUG_HOME=/usr/local/opt/zplug
    export PATH="/usr/local/opt/python/libexec/bin:/usr/local/opt/python@3.8/bin:/home/faith/.npm/bin:/home/faith/.bin:$PATH"
else
    export ZPLUG_HOME=$HOME/zplug
    export PATH="$PATH:/home/faith/.local/bin:/home/faith/.npm/bin:/home/faith/.bin"
fi

