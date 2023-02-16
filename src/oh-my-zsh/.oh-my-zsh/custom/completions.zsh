#Completions

#[ -s "/home/frostjust/.jabba/jabba.sh" ] && source $HOME/.jabba/jabba.sh
[ -s $HOME/.asdf/asdf.sh ] && source $HOME/.asdf/asdf.sh
#[ -s $HOME/.asdf/completions/asdf.bash ] && source $HOME/.asdf/completions/asdf.bash
if [ -e ${HOME}/.iterm2_shell_integration.zsh ]; then . ${HOME}/.iterm2_shell_integration.zsh; fi
#eval "$(op completion zsh)"; compdef _op op
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Pyenv/pipx initialization
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#eval "$(register-python-argcomplete pipx)"


## Babashka completion
_bb_tasks() {
    local matches=(`bb tasks |tail -n +3 |cut -f1 -d ' '`)
    compadd -a matches
    _files # autocomplete filenames as well
}
compdef _bb_tasks bb


# bun completions
[ -s "/Users/justin.frost/.oh-my-zsh/completions/_bun" ] && source "/Users/justin.frost/.oh-my-zsh/completions/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


