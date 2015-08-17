#!/bin/bash

if [[ $1 == "u" ]]; then
	echo volume up
    pactl set-sink-volume @DEFAULT_SINK@ +4%; paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
elif [[ $1 == "d" ]]; then
	echo volume down
    pactl set-sink-volume @DEFAULT_SINK@ -4%; paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
fi
