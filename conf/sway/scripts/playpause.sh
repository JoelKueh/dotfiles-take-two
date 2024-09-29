#!/usr/bin/bash

msgId="991053"

pactl set-sink-mute @DEFAULT_SINK@ toggle
dunstify -a "playpause.sh" \
	-u low \
	-r "$msgId" \
	"Playback Toggled"
