
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

source ~/.zinit/bin/zinit.zsh

# vi mode
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char

# lfcd () {
#     tmp="$(mktemp)"
#     fid="$(mktemp)"
#     startlf -command '$printf $id > '"$fid"'' -last-dir-path="$tmp" "$@"
#     id="$(cat "$fid")"
#     archivemount_dir="/tmp/__lf_archivemount_$id"
#     if [ -f "$archivemount_dir" ]; then
#         cat "$archivemount_dir" | \
#             while read -r line; do
#                 sudo umount "$line"
#                 rmdir "$line"
#             done
#         rm -f "$archivemount_dir"
#     fi
#     if [ -f "$tmp" ]; then
#         dir="$(cat "$tmp")"
#         rm -f "$tmp"
#         if [ -d "$dir" ]; then
#             if [ "$dir" != "$(pwd)" ]; then
#                 cd "$dir"
#             fi
#         fi
#     fi
# }
# bindkey -s '^o' 'lfcd\n'

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

# asdf
. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
source ~/.poetry/env

# Load using the for-syntax
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions \

zinit wait"2" lucid for \
    wfxr/forgit \

# zinit from"gh-r" as"program" mv"direnv* -> direnv" \
#     atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
#     pick"direnv" src="zhook.zsh" for \
#         direnv/direnv

eval "$(starship init zsh)"

zstyle ':completion:*' menu select
_comp_options+=(globdots)		# Include hidden files.


# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.


