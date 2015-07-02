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
export PAGER='less -r'
alias less='less -r'
alias vi='nvim'
alias vim='nvim'

# Go
export GOPATH=~/go

# Ruby
export PATH=$PATH:~/.gem/ruby/2.2.0/bin
