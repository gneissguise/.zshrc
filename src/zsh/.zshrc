# Prepend the path defaults
# (aka the zsh fun away)
# (aka I know array-fu!)
path=(
  "$HOME/.local/bin"
  $path
)

# Then export to sub-processes (make it inherited by child processes)
export PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH theme
ZSH_THEME="lambda-gitster" #-> github.com/ergenekonyigit/lambda-gitster

# Add settings for dumb terms to shortcut-out
[[ $TERM_PROGRAM == "vscode" ]] && unsetopt zle && PS1='$ ' && return
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# Come and get your plugins
plugins=(
  colorize
  direnv
  git
  zsh-256color             #-> github.com/chrissicool/zsh-256color
  F-Sy-H                   #-> github.com/zdharma/fast-syntax-highlighting
  zsh-completions          #-> github.com/zsh-users/zsh-completions
)

# If you exited before the next calls
# then you are the lucky one... 😈
source "$ZSH/oh-my-zsh.sh"

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# X11 DISPLAY env
export DISPLAY=':0'
