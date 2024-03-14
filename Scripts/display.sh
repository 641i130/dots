#!/bin/sh
# Get the string matching the pattern
DP=$(xrandr | grep -oE '^DisplayPort-[0-9]* connected' | sed 's/ connected//')
HDMI=$(xrandr | grep -oE '^HDMI-A-[0-9]* connected' | sed 's/ connected//')

# Assuming you have a variable named 'variable_name'

if [ -z "$DP" ] && [ -z "$HDMI" ]; then
  # DP is unplugged revert to single monitor
  xrandr --output eDP --primary --mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DisplayPort-6 --off --output DisplayPort-7 --off --output DisplayPort-8 --off --output DisplayPort-9 --off --output DisplayPort-10 --off
  # Terminate already running bar instances
  kill -9 `pidof polybar`
  # Wait until the processes have been shut down
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

  # Launch Polybar, using default config location ~/.config/polybar/config
  polybar primary -r &
elif [ -z "$HDMI" ]; then
  xrandr --output eDP --primary --mode 1920x1080 --pos 1317x3455 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1317x3455 --rotate normal --output DisplayPort-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DisplayPort-6 --off --output DisplayPort-7 --off --output DisplayPort-8 --off
  # Terminate already running bar instances
  kill -9 `pidof polybar`
  # Wait until the processes have been shut down
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

  # Launch Polybar, using default config location ~/.config/polybar/config
  polybar primary -r &

else
  # Plugged into both HDMI and dock
  # Quick reset
  xrandr --output eDP --primary ---mode 1920x1200 --pos 0x0 --rotate normal --output HDMI-A-0 --off --output DisplayPort-1 --off --output DisplayPort-2 --off --output DisplayPort-3 --off --output DisplayPort-4 --off --output DisplayPort-5 --off --output DisplayPort-6 --off --output DisplayPort-7 --off --output DisplayPort-8 --off --output DisplayPort-9 --off --output DisplayPort-10 --off
  # SET SCREEN
  xrandr --output eDP --mode 1920x1200 --pos 0x768 --rotate normal --output $HDMI --rate 59.95 --mode 2560x1440 --pos 1920x0 --rotate left --output $DP --rate 59.95 --mode 2560x1440 --pos 3360x0 --rotate right

  # Terminate already running bar instances
  kill -9 `pidof polybar`
  # Wait until the processes have been shut down
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

  # Launch Polybar, using default config location ~/.config/polybar/config
  MONITOR=$HDMI polybar primary -r &
  MAIN='eDP' polybar secondary -r &
  MONITOR2=$DP polybar third -r &
fi

# Set wallpaper
sleep 3
feh --bg-fill ~/Pictures/wp.jpg
