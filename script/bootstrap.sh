#!/bin/bash

BASE=$HOME/.dotfiles
CMD=ln
OPT="-s"

# Bash
$CMD $OPT $BASE/bash/bashrc $HOME/.bashrc

# fonts
$CMD $OPT $BASE/fonts/ $HOME/.fonts

# Git
$CMD $OPT $BASE/git/gitconfig $HOME/.gitconfig

# i3wm
$CMD $OPT $BASE/i3wm/i3/ $HOME/.i3
$CMD $OPT $BASE/i3wm/i3status.conf $HOME/.i3status.conf

# Latex
$CMD $OPT $BASE/latex/latexmkrc $HOME/.latexmkrc

# Tmux
$CMD $OPT $BASE/tmux/tmux.conf $HOME/.tmux.conf

# Vim
$CMD $OPT $BASE/vim/vimrc $HOME/.vimrc
$CMD $OPT $BASE/vim/dotvim/ $HOME/.vim

# X11
$CMD $OPT $BASE/x11/xinitrc $HOME/.xinitrc
$CMD $OPT $BASE/x11/Xmodmap $HOME/.Xmodmap
$CMD $OPT $BASE/x11/Xresources $HOME/.Xresources

# dunst
$CMD $OPT $BASE/dunst $HOME/.config/dunst
