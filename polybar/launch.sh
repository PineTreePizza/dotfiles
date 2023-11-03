#!/bin/bash

export DISPLAY=:0.0
export XAUTHORITY=/home/pine/.Xauthority

CONFIG=/home/pine/.config/polybar/config.ini

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Function to check if a monitor is eDP
is_edp() {
  xrandr --query | grep "^$1" | grep " connected" | grep "eDP" >/dev/null
}

# Launch Polybar for each connected monitor
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if is_edp $m; then
      # Load different config for eDP monitor
      MONITOR=$m /bin/polybar -r left -c "$CONFIG" &
      MONITOR=$m /bin/polybar -r right -c "$CONFIG" &
      MONITOR=$m /bin/polybar -r center -c "$CONFIG" &
    else
      # Load different config for non-eDP monitors
      MONITOR=$m /bin/polybar -r hdmi_left -c "$CONFIG" &
      MONITOR=$m /bin/polybar -r hdmi_right -c "$CONFIG" &
      MONITOR=$m /bin/polybar -r hdmi_center -c "$CONFIG" &
    fi
  done
else
  polybar -r main -c "$CONFIG" &
  polybar -r /bin/left -c "$CONFIG" &
  polybar -r /bin/right -c "$CONFIG" &
  polybar -r /bin/center -c "$CONFIG" &
fi

/bin/sleep 0.2
/bin/xdo lower -N "Polybar"

echo "Polybar launched..."
