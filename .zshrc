autoload -U colors && colors
PS1="%~ %{$reset_color%}%b "

# disable vi mode
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

source ~/.zinit/zinit.zsh

bindkey '^n' expand-or-complete
bindkey '^p' reverse-menu-complete
fpath+=~/.zfunc
# asdf
. $HOME/.asdf/asdf.sh
# append completions to fpath
fpath+=(${ASDF_DIR}/completions $fpath)


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

zinit light jeffreytse/zsh-vi-mode
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions


zinit wait"2" lucid for \
    wfxr/forgit \

#zstyle ':completion:*' menu select
#_comp_options+=(globdots)		# Include hidden files.

eval "$(asdf exec direnv hook zsh)"
direnv() { asdf exec direnv "$@"; }


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

if [ "$system_type" = "Darwin" ]; then
    eval "$(brew shellenv)"
    alias ls="gls -l --color=always"
    export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
else
    alias ls="ls -l --color=always"
fi

export LS_COLORS="$(vivid generate one-dark)"
