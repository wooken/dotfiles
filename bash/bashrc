PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]⚡ '
#PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '

export EDITOR=vim

# SETTINGS
# no duplicate lines or lines with spaces in history
HISTCONTROL=ignoreboth
# history size
HISTSIZE=1000
HISTFILESIZE=2000
# rewrap after window resize
shopt -s checkwinsize
# append to the history file instead of overwrite
shopt -s histappend
# auto-prepend cd when entering just a path
#shopt -s autocd

# FUNCTIONS
# set trap to intercept the non-zero return code of last program
PROGNAME=$(basename $0)
EC() { echo -e '\e[1;33m'${PROGNAME}: code $?'\e[m'; }
trap EC ERR

# ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Colored Manpages ------------------------------------------------------------
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
}

# cd and ls in one
cl() {
    if [[ -d "$1" ]]; then
        cd "$1"
        ls
    else
        echo "bash: cl: '$1': Directory not found"
    fi
}
