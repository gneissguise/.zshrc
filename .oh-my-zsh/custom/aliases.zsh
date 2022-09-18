#!/usr/bin/env zsh
#set -o errexit -o nounset

unalias grep
alias grep='rg'
alias lls='/usr/bin/ls'
unalias ls
alias ls='exa -F'
alias lsa='exa -Fla --sort=Name --bytes --group-directories-first --git --color-scale'
alias lsd='exa -FlaD --sort=Name --bytes --git --color-scale'
alias lsl='exa -Fa1'
alias -g firefox='/Applications/Firefox.app/Contents/MacOS/firefox-bin'

## Colorized help via bat!
alias bathelp='bat --plain --language=help'
help() {
   "$@" --help 2>&1 | bathelp
}

alias batlog='bat -pp --language=log'
alias cat='bat -pp'
