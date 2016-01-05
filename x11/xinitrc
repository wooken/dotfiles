#!/bin/bash

# disable trackpad while typing
syndaemon -k -d -i 0.2

if [ -f ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi

# fixes i3 missing system tray
xrandr --output eDP1 --primary

exec i3
