#!/usr/local/bin/zsh
## Custom Homebrew `brew` settings
export HOMEBREW_NO_ENV_HINTS=true
export HOMEBREW_NO_INSTALL_CLEANUP=true
export HOMEBREW_BAT=true
#export HOMEBREW_BOOTSNAP=true
export HOMEBREW_MAKE_JOBS=8
export HOMEBREW_NO_ANALYTICS=true

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# d12frosted/emacs-plus
#set -o nullglob
#globbed_emacs_path="/usr/local/Cellar/emacs-plus*/*(N)"

comped_emacs_path=( $(compgen -G /usr/local/Cellar/emacs-plus*/*(N)) )
export BREW_EMACS_PATH=${comped_emacs_path[-1]}

export COLORTERM='truecolor'
export EMAIL='justin.frost@gateless.com'
export NAME='Justin Frost'
export ORGANIZATION='Gateless'
export USER=${USER:-'justin.frost'}
export HOME=${HOME:-'/Users/justin.frost'}
export EMACS_APP="$BREW_EMACS_PATH/Emacs.app"
export EMACS_BINPATH="$BREW_EMACS_PATH/bin"
export EMACSPATH="$HOME/.config/emacs/bin:$EMACS_BINPATH:/usr/local/bin:$EMACSPATH"

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#export PAGER='bat --paging=never'
export BAT_THEME='ansi'

