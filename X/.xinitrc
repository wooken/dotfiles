#!/bin/bash

# fixes i3 missing system tray
xrandr --output eDP1 --primary

exec i3
