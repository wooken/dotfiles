#!/bin/bash

[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

exec i3
