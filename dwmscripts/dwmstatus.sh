#!/bin/sh

while true; do 
	xsetroot -name "$($HOME/dotfiles/dwmscripts/mpd-info.sh)| ♪ $(pacmd list-sinks | grep front | awk '{print $5}') | $($HOME/dotfiles/dwmscripts/getbattery.sh) $($HOME/dotfiles/dwmscripts/getdate.sh)"
	sleep 10
done
