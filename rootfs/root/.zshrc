#!/usr/bin/env bash
# shellcheck disable=SC1090

# ##############################################################################
# Import the zsh specific environment config
# ##############################################################################
# source ~/.zsh/oh-my-zsh.zsh
source ~/.zsh.d/antibody.zsh
source ~/.zsh.d/bindkeys.zsh
source ~/.zsh.d/colors.zsh
source ~/.zsh.d/completion.zsh
source ~/.zsh.d/exports.zsh
# source ~/.zsh/functions.zsh
source ~/.zsh.d/history.zsh
source ~/.zsh.d/setopt.zsh
source ~/.zsh.d/window.zsh
source ~/.zsh.d/zsh_hooks.zsh

type direnv &>/dev/null && eval "$(direnv hook zsh)"
