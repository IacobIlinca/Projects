#!/bin/bash

#Calculati media id-urilor proceselor din sistem pentru fiecare utilizator.

prev_user=""
count=0
sum=0
for user_pid in $(ps -ef | awk 'NR > 1 {print $1 "," $2}' | sort); do
	curr_user=$(echo "$user_pid" | cut -d, -f1)
	pid=$(echo "$user_pid" | cut -d, -f2)
	if [ "$curr_user" != "$prev_user" ]; then
		if [ "$count" -gt 0 ]; then
			echo "Avg for $prev_user is " $((sum/count))
		fi
		prev_user="$curr_user"
		sum=0
		count=0
	fi
	sum=$((sum+pid))
	count=$((count+1))
done

