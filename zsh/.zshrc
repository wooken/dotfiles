#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

unsetopt autopushd

# ZSH Vi mode
bindkey -M vicmd v edit-command-line
export KEYTIMEOUT=1

# default system editor
if which nvim 2>&1 > /dev/null; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi
export VISUAL=$EDITOR
alias vi=$EDITOR
alias vim=$EDITOR

# pure prompt
# disable auto git fetch
PURE_GIT_PULL=0

# Go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH=$PATH:~/.cargo/bin

# Personal bin
[ -d ~/bin ] && export PATH=$PATH:~/bin

alias em='emacs -nw'
alias emacs='emacs -nw'

# fzf
if $(type ag 2>&1 > /dev/null); then
    export FZF_DEFAULT_COMMAND='ag --ignore .git --hidden -g ""'
fi
alias vif='vi $(fzf --height 40%)'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ripgrep
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgreprc
