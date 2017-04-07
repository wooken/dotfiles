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
alias vi=$EDITOR
alias vim=$EDITOR

# Go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH=$PATH:~/.cargo/bin

# Personal bin
[ -d ~/bin ] && export PATH=$PATH:~/bin

alias em='emacs -nw'
alias emacs='emacs -nw'

# Termite dircolors
# generate using: dircolors -p > ~/.dircolors
# append to ~/.dircolors: TERM xterm-termite
#eval $(dircolors ~/.dircolors)

# Termite: open new terminal in cwd
#if [[ $TERM == xterm-termite ]]; then
#  . /etc/profile.d/vte.sh
#  __vte_osc7
#fi

# Base 16 shell colors
#BASE16_SHELL=$HOME/.config/base16-shell/
#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

alias vif='vi $(fzf --height 40%)'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
