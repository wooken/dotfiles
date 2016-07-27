#!/bin/bash

VBoxClient-all

# fixes i3 missing system tray
#xrandr --output eDP1 --primary
xrandr --output VGA-2 --auto --left-of VGA-1
xrandr --output VGA-2 --mode 1280x1024

exec i3
