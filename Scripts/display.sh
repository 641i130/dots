#!/bin/sh
# Get the string matching the pattern
DP=$(xrandr | grep -oE '^DP-[0-9]* connected' | sed 's/ connected//')
HDMI=$(xrandr | grep -oE '^HDMI-[0-9]* connected' | sed 's/ connected//')

# Assuming you have a variable named 'variable_name'

if [ -z "$DP" ] || [ -z "$HDMI" ]; then
  # DP is unplugged revert to single monitor
  xrandr --output eDP-1 --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-1 --off --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-4 --off --output DP-5 --off --output DP-6 --off --output DP-7 --off --output DP-8 --off --output DP-9 --off --output DP-10 --off
  # Terminate already running bar instances
  kill -9 `pidof polybar`
  # Wait until the processes have been shut down
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

  # Launch Polybar, using default config location ~/.config/polybar/config
  polybar primary -r &
else
  # Plugged into both HDMI and dock
  xrandr --output eDP-1 --rate 60.03 --mode 1920x1200 --pos 0x768 --rotate normal --output $HDMI --rate 59.95 --mode 2560x1440 --pos 1920x0 --rotate left --output $DP --rate 59.95 --mode 2560x1440 --pos 3360x0 --rotate right

  # Terminate already running bar instances
  kill -9 `pidof polybar`
  # Wait until the processes have been shut down
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

  # Launch Polybar, using default config location ~/.config/polybar/config
  MONITOR=$HDMI polybar primary -r &
  MAIN='eDP-1' polybar secondary -r &
  MONITOR2=$DP polybar third -r &
fi

# Set wallpaper
sleep 3
feh --bg-fill ~/Pictures/wp.jpg
