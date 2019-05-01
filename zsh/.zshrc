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

setopt hist_ignore_all_dups hist_save_no_dups

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
[ -d ~/bin ] && export PATH=~/bin:$PATH

# fzf
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!.git/*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# ripgrep
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgreprc
