#!/bin/bash

# create 25 new empty files per run
# file names are generated in the format <yourName><number>, <yourName><number+1>, ... (number increments of 1)
# for each new run continue your file name numbering from the last filename to be  generated in the most recent run

#Check if first run or a subsequent run and adjust counter

count=0
your_name="Christabel"
last_file_num=$(ls | grep "$your_name" | sed -e s/[^0-9]//g | sort -n | tail -1)
if [[ "$last_file_num" ]]; then
	count=$((last_file_num + 1))
else
	count=1
fi

#create 25 new  new files in current directory

limit=$((count + 25))
while [[ "$count" -le $((limit - 1)) ]]; do
	file_name="$your_name""$count"
	touch "$file_name"
	echo "File name $file_name has been created"
	count=$((count + 1))
done
echo "END OF PROGRAM>>>>"
