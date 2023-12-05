#! /bin/sh

setxkbmap -model pc104 -layout us,ru -variant ,, -option grp:alt_shift_toggle &

feh --bg-scale $HOME/.config/bspwm/wlppr.png &

xset s 240 600

xss-lock -n $HOME/.config/bspwm/dim-screen.sh --transfer-sleep-lock -- $HOME/.config/bspwm/lock.sh &

#emacs --daemon --display=GTK -l .config/emacs/init.el &

$HOME/.config/polybar/launch.sh &

sleep 1

compfy &
