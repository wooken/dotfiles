#!/bin/bash

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

# allows qt5ct to work. keepassxc uses qt5ct
export QT_QPA_PLATFORMTHEME=qt5ct qt5ct

exec i3
