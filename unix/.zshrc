autoload -U colors && colors
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

bindkey -e
bindkey '^n' expand-or-complete
bindkey '^p' reverse-menu-complete
fpath+=~/.zfunc

autoload edit-command-line; zle -N edit-command-line
#bindkey '^e' edit-command-line

[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

if [ "$system_type" = "Darwin" ]; then
    export PATH="/opt/local/bin:/opt/homebrew/bin:/opt/homebrew/opt/llvm/bin:$PATH:"
    eval "$(brew shellenv)"
    alias l="gls -lh --color=always"
    alias ls="gls"
    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
    export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"
    export PNPM_HOME="$HOME/Library/pnpm"
else
    export PNPM_HOME="$HOME/local/share/pnpm"
    alias l="ls -lh --color=always"
fi

### Windows ###
export PATH="$PATH:/mnt/c/Users/faith/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/faith/AppData/Local/Programs/Microsoft VS Code/bin:/mnt/c/Program Files/Docker/Docker/resources/bin:/mnt/c/ProgramData/DockerDesktop/version-bin:/mnt/c/WINDOWS"

export LS_COLORS="$(vivid generate one-dark)"
export NNN_OPTS="H"
export NNN_PLUG='p:preview-tui'
#export SPLIT='v'

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function gi () { curl -sLw "\n" https://www.toptal.com/developers/gitignore/api/\$@ ;}

fix_mosh_client() {
  local fw='/usr/libexec/ApplicationFirewall/socketfilterfw'
  local mosh_sym="$(which mosh-client)"
  local mosh_abs="$(readlink -f $mosh_sym)"

  sudo "$fw" --setglobalstate off
  sudo "$fw" --add "$mosh_sym"
  sudo "$fw" --unblockapp "$mosh_sym"
  sudo "$fw" --add "$mosh_abs"
  sudo "$fw" --unblockapp "$mosh_abs"
  sudo "$fw" --setglobalstate on
}

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

eval "$(mise activate zsh)"

zcompile_many() {
  local f
  for f; do zcompile -R -- "$f".zwc "$f"; done
}

compile_plugins() {
    zcompile_many() {
      local f
      for f; do zcompile -R -- "$f".zwc "$f"; done
    }
    # Clone and compile to wordcode missing plugins.
    set +m
    {
    zcompile_many $ZSH_PLUGINS_HOME/zsh-syntax-highlighting/{zsh-syntax-highlighting.zsh,highlighters/*/*.zsh} &
    zcompile_many $ZSH_PLUGINS_HOME/zsh-autosuggestions/{zsh-autosuggestions.zsh,src/**/*.zsh}&
    make -C $ZSH_PLUGINS_HOME/powerlevel10k pkg &
    zcompile_many $ZSH_PLUGINS_HOME/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh& } &>/dev/null
    wait
    set -m
}

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -Uz compinit && compinit
[[ ~/.zcompdump.zwc -nt ~/.zcompdump ]] || zcompile_many ~/.zcompdump
unfunction zcompile_many
_comp_options+=(globdots)		# Include hidden files.

ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Load plugins.
source $ZSH_PLUGINS_HOME/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGINS_HOME/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH_PLUGINS_HOME/powerlevel10k/powerlevel10k.zsh-theme
source $ZSH_PLUGINS_HOME/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

eval "$(atuin init zsh --disable-up-arrow)"

source ~/.p10k.zsh
