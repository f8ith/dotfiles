#!/bin/bash

DOTFILES_HOME=~/dotfiles/unix
POSITIONAL_ARGS=()

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

case $1 in
  init|bootstrap)
    if [ "$system_type" = "Darwin" ]; then
      echo "true"
      /opt/homebrew/bin/gcp -rsvf "$DOTFILES_HOME"/. ~
    else
        cp -rsvf "$DOTFILES_HOME"/. ~
    fi
    ;;
  pull)
    git -C "$DOTFILES_HOME" pull
    ;;
  add)
    git -C "$DOTFILES_HOME" add .
    ;;
  commit)
    if [-n "$2"]; then
      git -C "$DOTFILES_HOME" commit -m "$2"
    else
      git -C "$DOTFILES_HOME" commit
    fi
    ;;
  *)
    echo "Unknown command $1"
    exit 1
    ;;
esac
