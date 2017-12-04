#!/bin/bash

daytemp="$(date +"%d")"
day=$(echo "${daytemp: -1}")

if [[ "daytemp" -gt 10 ]]; then
	dayoutput=$daytemp
else
	dayoutput=$day
fi

#echo $day
#echo $daytemp
#echo $dayoutput

if (( day == 1 )); then
		ordinal=st
elif (( day == 2 )); then
		ordinal=nd
elif (( day == 3 )); then
		ordinal=rd
else
		ordinal=th
fi

echo "$(date +'%A, %B ')$dayoutput$ordinal - $(date +'%H:%M')"
