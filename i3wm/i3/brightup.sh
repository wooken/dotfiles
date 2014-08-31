#!/bin/bash

xbacklight -inc 5
LEVEL=$(xbacklight | awk '{print int($1+0.5)}')
notify-send "Screen Backlight" "$LEVEL"% -u low -t 1000
