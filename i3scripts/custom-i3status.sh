#!/bin/sh
# shell script to prepend i3status with more stuff

i3status | while :
do
        read line
	echo "$($HOME/dotfiles/i3scripts/getdate.sh) $(echo "                                                         ") | $line" || exit 1
done
