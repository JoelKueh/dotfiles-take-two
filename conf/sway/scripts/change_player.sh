#!/usr/bin/bash

DIRECTION=${1:-1}
msgId="991052"

# Update the player
if [[ $DIRECTION == 1 ]]; then
	playerctld shift
else
	playerctld unshift
fi

# Notify the user
dunstify -a "playerctld" \
	-u low \
	-r "$msgId" \
	"Controlling player $(playerctl -l | head -n1)"
