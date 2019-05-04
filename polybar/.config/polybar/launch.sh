#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar
#polybar unimatrix &

primary="eDP1"

if type "xrandr"; then
    # let primary display grab systray
    MONITOR=$primary polybar --reload unimatrix &
    sleep 1
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        [ "$m" != "$primary" ] && MONITOR=$m polybar --reload unimatrix &
    done
else
    polybar --reload unimatrix &
fi

echo "Polybars launched..."
