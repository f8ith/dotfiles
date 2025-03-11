#!/bin/zsh

POSITIONAL_ARGS=()

ZSH_PLUGINS_HOME="${ZSH_PLUGINS_HOME:-${XDG_DATA_HOME:-${HOME}/.local/share}/zsh}"
DOTFILES_HOME="${DOTFILES_HOME:-~/dotfiles/unix}"
REPOS=(
  https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGINS_HOME/zsh-syntax-highlighting
  https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PLUGINS_HOME/zsh-autosuggestions
  https://github.com/romkatv/powerlevel10k.git $ZSH_PLUGINS_HOME/powerlevel10k
  https://github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH_PLUGINS_HOME/fast-syntax-highlighting
  https://github.com/vifm/vifm-colors.git $HOME/.config/vifm/colors
)
REPOSLEN="${#REPOS[@]}"

while [[ $# -gt 0 ]]; do
  case $1 in
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

make_links() {
    echo "Making links..."
    if [ "$system_type" = "Darwin" ]; then
      {/opt/homebrew/bin/gcp -rsv "$DOTFILES_HOME"/. ~ } &>/dev/null
    else
      {cp -rsv "$DOTFILES_HOME"/. ~ } &>/dev/null
    fi
}

update_repos() {
  end=$(( $REPOSLEN - 1 ))
  for i in $(seq 0 2 $end); do
    if [[ ! -e "${REPOS[@]:$i + 1:1}" ]]; then
      git clone --depth 1 "${REPOS[@]:$i:1}" "${REPOS[@]:$i+1:1}"
    fi
  done
  for i in $(seq 0 2 $end); do {( echo "Pulling from ${REPOS[@]:$i:1}"; cd "${REPOS[@]:$i + 1:1}"/..; {git pull} &>/dev/null; ) & } 2>/dev/null; done
  wait
}

setup() {
  if [[ -z $(git config --get core.excludesfile) ]]; then
    git config --global core.excludesFile '~/.gitignore'
  fi
}


bootstrap() {
    setup()
    echo "Updating git repos:"
    if [[ ! $(git -C $DOTFILES_HOME pull --rebase) ]]; then
      exit 1
    fi
    update_repos
    make_links
    echo "Compiling zsh plugins..."
    source ~/.zshrc
    compile_plugins
}

edit() {
}

add() {
}


case $1 in
  init|bootstrap|update)
    bootstrap
    ;;
  link)
    make_links
    ;;
  edit)
    edit
    ;;
  *)
    bootstrap
    ;;
esac
