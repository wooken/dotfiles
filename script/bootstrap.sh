#!/bin/bash

BASE=~/.dotfiles
CMD=ln
OPT="-s"

# Bash
$CMD $OPT $BASE/bash/bashrc ~/.bashrc

# fonts
$CMD $OPT $BASE/fonts/ ~/.fonts

# Git
$CMD $OPT $BASE/git/gitconfig ~/.gitconfig

# i3wm
$CMD $OPT $BASE/i3wm/i3/ ~/.i3
$CMD $OPT $BASE/i3wm/i3status.conf ~/.i3status.conf

# Latex
$CMD $OPT $BASE/latex/latexmkrc ~/.latexmkrc

# Tmux
$CMD $OPT $BASE/tmux/tmux.conf ~/.tmux.conf

# Vim
$CMD $OPT $BASE/vim/vimrc ~/.vimrc
$CMD $OPT $BASE/vim/dotvim/ ~/.vim

# X11
$CMD $OPT $BASE/x11/xinitrc ~/.xinitrc
$CMD $OPT $BASE/x11/Xmodmap ~/.Xmodmap
$CMD $OPT $BASE/x11/Xresources ~/.Xresources
