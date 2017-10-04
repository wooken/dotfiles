#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch bar
MONITOR=eDP1 polybar unimatrix &
MONITOR=DP2 polybar unimatrix &

echo "Polybars launched..."
