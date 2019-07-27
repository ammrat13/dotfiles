#!/bin/bash

# RAM script for i3blocks
# Gets the amount of RAM and SWAP we have used

source .config/i3blocks/scripts/colors.sh

# Get the values from `free`
ram=$( \
	free -m \
		| sed -e '2!d' \
		| awk '{print $3/1024}' \
		| xargs printf '%.2f' \
)
swap=$( \
	free -m \
		| sed -e '3!d' \
		| awk '{print $3/1024}' \
		| xargs printf '%.2f' \
)

# full_text
echo "RAM: $ram GiB  SWAP: $swap GiB"

# short_text
echo "RAM: $ram GiB  SWAP: $swap GiB"

# Color it red if swapping
if [[ $swap != '0.00' ]]
then
	echo "$COLOR_BAD"
# Color it yellow if high ram utilization
elif [[ $(free -m | sed -e '2!d' | awk '{print 100*$3/$4}' | xargs printf '%.0f') -ge '75' ]]
then
	echo "$COLOR_DEGRADED"
else
	echo "$COLOR_NORMAL"
fi
