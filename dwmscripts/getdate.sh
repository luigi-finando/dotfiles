#!/bin/bash

daytemp="$(date +"%d")"

if (($daytemp == 11|12|13));then
	day=$daytemp
else
	day=$(echo "${daytemp: -1}")
fi

if (( day == 1 )); then
		ordinal=st
elif (( day == 2 )); then
		ordinal=nd
elif (( day == 3 )); then
		ordinal=rd
else
		ordinal=th
fi

echo "$(date +'%A, %B %d')$ordinal - $(date +'%H:%M')"
