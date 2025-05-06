# Default Programs

export EDITOR="nvim"
export VISUAL="nvim"

# Fcitx settings
export XDG_CONFIG_HOME="$HOME/.config"

# XDG Directories
export XDG_SCREENSHOTS_DIR=~/Pictures/Screenshots

system_type=$(uname -s)

export PATH="$HOME/bin:$HOME/go/bin/:$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

# Dotfiles
export ZSH_PLUGINS_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh"
export DOTFILES_HOME=~/dotfiles/unix
