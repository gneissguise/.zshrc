#!/usr/bin/env zsh
#set -o errexit -o nounset

## Colorized help via bat!
alias bathelp='bat --plain --language=help'
help() {
   "$@" --help 2>&1 | bathelp
}

alias batlog='bat -pp --language=log'
alias cat='bat -pp'
