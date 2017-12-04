#!/bin/sh
notify-send -t 0 "$(mpc current) is playing"
notify-send -t 0 "Sound is at $(pacmd list-sinks | grep front | awk '{print $5}')"
notify-send -t 0 "$(/usr/lib/update-notifier/apt-check --human-readable)"
