#!/bin/sh
# Get the string matching the pattern
DP=$(xrandr | grep -oE '^DP-[0-9]* connected' | sed 's/ connected//')
HDMI=$(xrandr | grep -oE '^HDMI-[0-9]* connected' | sed 's/ connected//')

# Print the value of the variable for verification
echo $DP
echo $HDMI

# Run xrandr
xrandr --output eDP-1 --rate 60.03 --mode 1920x1200 --pos 0x768 --rotate normal --output $HDMI --rate 59.95 --mode 2560x1440 --pos 1920x0 --rotate left --output $DP --rate 59.95 --mode 2560x1440 --pos 3360x0 --rotate right

# Set wallpaper
sleep 3
feh --bg-fill ~/Pictures/wp.jpg

~/.config/polybar/launch.sh
