# Prepend the path defaults
# (aka the zsh fun away)
# (aka I know array-fu!)
path=(
  "$HOME/bin"
  "$HOME/.bin"
  "$HOME/.local/bin"
  "$HOME/.config/emacs/bin"
  "$HOME/.pyenv/bin"
  "$HOME/.cargo/bin"
  "$(brew --prefix)/bin"
  "$HOME/Repos/gateless/sdf"
  "$HOME/n/bin"
  "/usr/local/opt/openssl@3/bin"
  "/usr/local/opt/curl/bin"
  "/usr/local/opt/sqlite/bin"
  "/usr/local/sbin"
  "/usr/local/bin"
  $path
)

# Then export to sub-processes (make it inherited by child processes)
export PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH theme
ZSH_THEME="lambda-gitster" #-> github.com/ergenekonyigit/lambda-gitster

# Add settings for dumb terms to shortcut-out
[[ $INSIDE_EMACS == 'vterm' ]] && \
  alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear' && \
  source "$ZSH/custom/emacs.zsh"
[[ $TERM_PROGRAM == "vscode" ]] && unsetopt zle && PS1='$ ' && return
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# Come and get your plugins
plugins=(
#  autoupdate
#  asdf
  colorize
  direnv
  git
  zsh-256color             #-> github.com/chrissicool/zsh-256color
#  zsh-autosuggestions
  fast-syntax-highlighting #-> github.com/zdharma/fast-syntax-highlighting
  zsh-completions          #-> github.com/zsh-users/zsh-completions
#  zsh-more-completions
#  zsh-bash-completions-fallback
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
