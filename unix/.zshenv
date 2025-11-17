# Default Programs
export EDITOR="nvim"
export XDG_SCREENSHOTS_DIR=~/Pictures/Screenshots

system_type=$(uname -s)
export PATH="$HOME/bin:$HOME/go/bin/:$HOME/.cargo/bin:$HOME/.local/bin:$PATH"

# Dotfiles
export ZSH_PLUGINS_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh"
export DOTFILES_HOME=~/dotfiles/unix
