#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
export fg_a="#ff0000"
export bg_a="#0d0d0d"
export fg_prefix_a="#ff0000"
export fg_prefix_a="#ff0000"
export sep_a="#000000"
export bar_primary_a="#ff0000"
export bar_seperator_a="#ff0000"
export bar_secondary_a="#ff0000"
export i3_a="#ff0000"
export inet_prefix_a="#ff0000"
export inactive_prefix_a="#ff0000"
export active_prefix_a="#ff0000"
export mpd_prefix_a="#ff0000"
export vol_prefix_a="#ff0000"
export cpu_prefix_a="#ff0000"
export mem_prefix_a="#ff0000"
export bat_prefix_a="#ff0000"
export time_a="#ff0000"
# Launch Polybar, using default config location ~/.config/polybar/config
polybar example &

echo "Polybar launched..."
