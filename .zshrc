autoload -U colors && colors
PS1="%~ %{$reset_color%}%b "

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

source ~/.zinit/bin/zinit.zsh

bindkey '^n' expand-or-complete
bindkey '^p' reverse-menu-complete
fpath+=~/.zfunc

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

# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
# fi

zinit light jeffreytse/zsh-vi-mode
zinit light zdharma/fast-syntax-highlighting 
zinit light zsh-users/zsh-autosuggestions 
zinit light zsh-users/zsh-completions 


zinit wait"2" lucid for \
    wfxr/forgit \

# zinit from"gh-r" as"program" mv"direnv* -> direnv" \
#     atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' \
#     pick"direnv" src="zhook.zsh" for \
#         direnv/direnv


#zstyle ':completion:*' menu select
#_comp_options+=(globdots)		# Include hidden files.

eval $(thefuck --alias)

if [ "$system_type" = "Darwin" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    alias ls="gls -l --color=always"
fi

export LS_COLORS="$(vivid generate one-dark)"
