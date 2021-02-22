#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload main -c  $HOME/.config/polybar/config.ini &
  done
else
  polybar --reload main -c  $HOME/.config/polybar/config.ini &
fi
# Launch polybar
#polybar main -c $HOME/.config/polybar/config.ini &
#polybar main2 -c $HOME/.config/polybar/config.ini &
