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
bindkey '^r' history-incremental-search-backward
export KEYTIMEOUT=1

# default system editor
if which nvim 2>&1 > /dev/null; then
    export EDITOR='nvim'
else
    export EDITOR='vim'
fi
export VISUAL=$EDITOR
export PAGER='less -r'
alias less='less -r'
alias vi=$EDITOR
alias vim=$EDITOR

# TMUX disable ctrl-d eof
if [ -n "$TMUX" ]; then set -o ignoreeof; fi

# Personal bin
export PATH=$PATH:~/bin

# Go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

alias em='emacs -nw'
alias emacs='emacs -nw'
