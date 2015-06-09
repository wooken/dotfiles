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
export VISUAL=vim
export EDITOR=vim

# Omnibox Bin
export PATH=$PATH:~/Omnibox/bin

# Go
#export GOROOT=~/Omnibox/go
#export PATH=$PATH:$GOROOT/bin
export GOPATH=~/Omnibox/go

# Ruby
export PATH=$PATH:~/.gem/ruby/2.1.0/bin

export EDITOR=vim
unsetopt autopushd

# bc with math lib
alias bc='bc -l'
alias vi='vim'
