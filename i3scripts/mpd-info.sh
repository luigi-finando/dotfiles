#!/bin/sh

mpdstate="$(mpc | grep "\[" | awk '{print $1}')"

if [ -z "$(mpc | sed -n '2p')" ];then
	echo " "
elif [ "$mpdstate" = "[paused]" ];then
	echo "▮▮ $( mpc current) "
else
	echo "▶ $(mpc current) "
fi
