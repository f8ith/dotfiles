autoload -U colors && colors
PS1="%~ %{$reset_color%}%b "

# disable vi mode
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

bindkey '^n' expand-or-complete
bindkey '^p' reverse-menu-complete
fpath+=~/.zfunc

lfcd () {
    tmp="$(mktemp)"
    fid="$(mktemp)"
    lf -command '$printf $id > '"$fid"'' -last-dir-path="$tmp" "$@"
    id="$(cat "$fid")"
    archivemount_dir="/tmp/__lf_archivemount_$id"
    if [ -f "$archivemount_dir" ]; then
        cat "$archivemount_dir" | \
            while read -r line; do
                sudo umount "$line"
                rmdir "$line"
            done
        rm -f "$archivemount_dir"
    fi
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        if [ -d "$dir" ]; then
            if [ "$dir" != "$(pwd)" ]; then
                cd "$dir"
            fi
        fi
    fi
}
bindkey -s '^o' 'lfcd\n'

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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

if [ "$system_type" = "Darwin" ]; then
    export PATH="/opt/local/bin:/opt/homebrew/bin:/opt/homebrew/Cellar/llvm/15.0.7_1/bin:$PATH:"
    eval "$(brew shellenv)"
    alias l="gls -lh --color=always"
    alias ls="gls"
    export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
else
    alias l="ls -lh --color=always"
fi

export LS_COLORS="$(vivid generate one-dark)"

export NNN_OPTS="H"
export NNN_PLUG='p:preview-tui'
#export SPLIT='v'

n () # to cd on quit
{
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    nnn -a "$@"
    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

function gi () { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/\$@ ;}

# pnpm
export PNPM_HOME="/Users/faith/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(rtx activate zsh)"
### End of Zinit's installer chunk

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
