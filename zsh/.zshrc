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

# fix unreadable grep colors
export GREP_COLORS='mt=1;91;40'

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

# Do not remove suffix characters (after tab completion) with subsequent pipe character
# https://superuser.com/questions/613685/how-stop-zsh-from-eating-space-before-pipe-symbol
ZLE_REMOVE_SUFFIX_CHARS=""

# pure prompt
# disable auto git fetch
PURE_GIT_PULL=0
PURE_GIT_UNTRACKED_DIRTY=0
# show system time
PROMPT='%F{white}%* '$PROMPT

# Go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH=$PATH:~/.cargo/bin

# Personal bin
[ -d ~/bin ] && export PATH=~/bin:$PATH

# fzf
export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git/*'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --follow"
#export FZF_ALT_C_COMMAND="fd --type d --follow --hidden --exclude '.git'"
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
# Remap CTRL-T to CTRL-F
bindkey -r '^T'
bindkey '^F' fzf-file-widget

# ripgrep
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/ripgreprc
