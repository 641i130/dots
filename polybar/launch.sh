#!/bin/sh

# Terminate already running bar instances
kill -9 `pidof polybar`

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
polybar primary -r &
polybar secondary -r &
polybar third -r &

echo "Polybar launched..."
