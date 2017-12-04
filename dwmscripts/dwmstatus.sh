#!/bin/sh

while true; do 
	xsetroot -name "$($HOME/dotfiles/dwscripts/mpdstatus.sh) $($HOME/dotfiles/dwscripts/getbattery.sh) $($HOME/dotfiles/dwmscripts/getdate.sh)"
	sleep 7
done
