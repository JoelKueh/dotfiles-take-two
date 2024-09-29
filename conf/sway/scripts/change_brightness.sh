#!/bin/bash

msgId="991050"
DELTA=$1
brightnessctl s $DELTA

CUR="$(brightnessctl g)"
MAX="$(brightnessctl m)"
CUR=$((CUR * 100 / MAX))

dunstify -a "change_brightness.sh" \
	-u low \
	-r "$msgId" \
	-h int:value:"$CUR" \
	"Brightness: ${CUR}%"
