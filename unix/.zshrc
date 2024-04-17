autoload -U colors && colors
# disable vi mode
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
#PS1="%~ %{$reset_color%}%b "
#ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

PLUGINS_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zsh"

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

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

if [ "$system_type" = "Darwin" ]; then
    export PATH="/opt/local/bin:/opt/homebrew/bin:/opt/homebrew/opt/llvm/bin:$PATH:"
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

export PNPM_HOME="/Users/faith/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(mise activate zsh)"

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function zcompile-many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

zupdate() {
    function zcompile-many() {
      local f
      for f; do zcompile -R -- "$f".zwc "$f"; done
    }
    # Clone and compile to wordcode missing plugins.
    if [[ ! -e $PLUGINS_HOME/zsh-syntax-highlighting ]]; then
      git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $PLUGINS_HOME/zsh-syntax-highlighting
    fi
    if [[ ! -e $PLUGINS_HOME/zsh-autosuggestions ]]; then
      git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git $PLUGINS_HOME/zsh-autosuggestions
    fi
    if [[ ! -e $PLUGINS_HOME/powerlevel10k ]]; then
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $PLUGINS_HOME/powerlevel10k
    fi
    if [[ ! -e $PLUGINS_HOME/fast-syntax-highlighting ]]; then
      git clone --depth=1 https://github.com/zdharma-continuum/fast-syntax-highlighting.git $PLUGINS_HOME/fast-syntax-highlighting
    fi
    for i in $PLUGINS_HOME/*/.git; do ( echo $i; cd $i/..; git pull; ) &; done
    zcompile-many $PLUGINS_HOME/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh} &
    zcompile-many $PLUGINS_HOME/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh} &
    make -C $PLUGINS_HOME/powerlevel10k pkg &
    zcompile-many $PLUGINS_HOME/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh &
    wait
    source ~/.zshrc
}

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile-many ~/.zcompdump
unfunction zcompile-many
_comp_options+=(globdots)		# Include hidden files.

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Load plugins.
source $PLUGINS_HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $PLUGINS_HOME/zsh-autosuggestions/zsh-autosuggestions.zsh
source $PLUGINS_HOME/powerlevel10k/powerlevel10k.zsh-theme
source $PLUGINS_HOME/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source ~/.p10k.zsh
