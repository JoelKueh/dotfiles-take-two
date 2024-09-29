#!/usr/bin/bash

DELTA=$1
msgId="991049"

CUR="$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | grep -oe '[0-9]*')"
NEW="$(echo $CUR$DELTA | bc)"
NEW=$((NEW > 100 ? 100 : NEW))
NEW=$((NEW < 0 ? 0 : NEW))
echo "vol: $NEW"

pactl set-sink-volume @DEFAULT_SINK@ $NEW%
dunstify -a "change_volume.sh" \
	-u low \
	-i audio-volume-high \
	-r "$msgId" \
	-h int:value:"$NEW" \
	"Volume: ${NEW}%"
