#!/usr/bin/bash

msgId="991051"

echo "sink: $SINK"
echo "vol: $NEW"

pactl set-sink-mute @DEFAULT_SINK@ toggle

dunstify -a "mute_audio.sh" \
	-u low \
	-r "$msgId" \
	"Audio Muted"
