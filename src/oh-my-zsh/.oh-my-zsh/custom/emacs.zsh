#!/usr/bin/env zsh
#  set -euo pipefail

# if [[ "$TERM" == "dumb" ]]; then
#     unset zle_bracketed_paste
#     unset zle
#     PS1='$ '
#     return
# fi

## Emacs - vterm settings function
vterm_printf(){
  if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
    # Tell tmux to pass the escape sequences through
    printf "\ePtmux;\e\e]%s\007\e\\" "$1"
  elif [ "${TERM%%-*}" = "screen" ]; then
    # GNU screen (screen, screen-256color, screen-256color-bce)
    printf "\eP\e]%s\007\e\\" "$1"
  else
    printf "\e]%s\e\\" "$1"
  fi
}

if [ -n "$INSIDE_EMACS" ]; then
  vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
  }
  PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'
fi

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
  alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
fi

## Emacs stuff
source ~/.oh-my-zsh/custom/brew.zsh
#alias emacs="$EMACS_BINPATH/emacs"
#alias emacsclient="$EMACS_BINPATH/emacsclient"

## env vars for doooooom!
export EMACS="$EMACS_BINPATH/emacs"
export EMACSDIR="$HOME/.config/emacs"
export DOOMDIR="$HOME/.doom.d"
export DOOMPAGER='bat --paging=never'
#MANPAGER="sh -c 'col -bx | bat -l man -p'"

e()     { pgrep emacs && emacsclient -nc --args "$@" || emacs -nw $@ }
ediff() { emacsclient -nw --eval "(ediff-files \"$1\" \"$2\")"; }
eman()  { emacsclient -nw --eval "(switch-to-buffer (man \"$1\"))"; }
ekill() { emacsclient -n --eval "(kill-emacs)" || emacs --batch --eval "(kill-emacs)" }
dmr ()  { open -na Emacs.app --args "$@" }
alias edit="emacs -Q -t"
