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

# Go
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# Rust
export PATH=$PATH:~/.cargo/bin

# Perlbrew
source ~/perl5/perlbrew/etc/bashrc

# Personal bin
[ -d ~/bin ] && export PATH=$PATH:~/bin

alias em='emacs -nw'
alias emacs='emacs -nw'

# spaceship zsh/prezto theme
SPACESHIP_PROMPT_ORDER=(
time
dir
git
venv
pyenv
line_sep
vi_mode
exit_code
char
)
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_COLOR=111
SPACESHIP_TIME_12HR=true
SPACESHIP_DIR_PREFIX=
SPACESHIP_DIR_TRUNC=2
SPACESHIP_EXIT_CODE_SHOW=true

# fzf
if $(type ag 2>&1 > /dev/null); then
    export FZF_DEFAULT_COMMAND='ag --ignore .git --hidden -g ""'
fi
alias vif='vi $(fzf --height 40%)'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ripgrep
export RIPGREP_CONFIG_PATH=~/.config/ripgrep/.ripgreprc
