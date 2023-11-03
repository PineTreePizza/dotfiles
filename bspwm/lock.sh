#!/bin/sh

BLANK='#3e3e3e'
CLEAR='#9096cf22'
DEFAULT='#525252'
TEXT='#dadada'
WRONG='#4a4a4a'
VERIFYING='#dadada'
OUTLINE='#1c1621'
NONE='#00000000'

i3lock \
	--insidever-color=$NONE \
	--ringver-color=$VERIFYING \
	\
	--insidewrong-color=$CLEAR \
	--ringwrong-color=$WRONG \
	\
	--inside-color=$NONE \
	--ring-color=$DEFAULT \
	--line-color=$NONE \
	--separator-color=$NONE \
	\
	--verif-color=$TEXT \
	--wrong-color=$TEXT \
	--keyhl-color=$VERIFYING \
	--bshl-color=$VERIFYING \
	\
	--screen 0 \
	--radius 250 \
	--ring-width 120 \
	--indicator \
	--verif-font="Terminess Nerd Font"\  \
	--wrong-font="Terminess Nerd Font"\  \
	--greeter-font="Terminess Nerd Font"\  \
	--layout-font="Terminess Nerd Font"\  \
	--date-font="Terminess Nerd Font"\  \
	--time-font="Terminess Nerd Font"\  \
	--verif-size=64\  \
	--wrong-size=64\  \
	--greeter-size=64\  \
	--layout-size=64\  \
	--date-size=64\  \
	--time-size=64\  \
	--tiling \
	--ind-pos="1920/2:1080/2" \
	--verif-text="" \
	--wrong-text="" \
	-i $HOME/.config/bspwm/Lock.png
