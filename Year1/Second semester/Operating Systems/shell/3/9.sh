#!/bin/bash

if [ "$#" -lt 1 ]; then
	echo "ERROR:Provide at leaast one file."
	exit 1
fi

for file in "$@"
do
	echo "${file}:"
	numb=$(cat "$file" | grep -Po '(?<!\d)[1-9]*[02468] (?!\d) ' | sort -n | uniq -c | sort -n -r -k 1,1)
	echo "$numb"
done
