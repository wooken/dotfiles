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

alias em='emacs -nw'
alias emacs='emacs -nw'

# Termite dircolors
# generate using: dircolors -p > ~/.dircolors
# append to ~/.dircolors: TERM xterm-termite
eval $(dircolors ~/.dircolors)

# Termite: open new terminal in cwd
if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
