#!/bin/bash

# CPU script for i3blocks
# Gets the cpu usage and temperatures

source ~/.config/i3blocks/scripts/colors.sh

# Get the values from mpstat and lm_sensors
load=$( \
	mpstat 1 1 \
		| sed -e '4!d' \
		| awk '{print 100-$NF}' \
		| xargs printf '%.0f'
)
temp=$( \
	sensors \
		| grep 'Package' \
		| awk '{print $4}' \
		| sed -e 's/^.//g' -e 's/..$//g' \
)

# full_text
echo "CPU: $load%"

# short_text
echo "CPU: $load%"

# Color it red if temp above 70
if [[ $(echo $temp | xargs printf '%.0f') -ge '70' ]]
then
	echo "$COLOR_BAD"
# Color it yellow if high cpu utilization
elif [[ $(echo $load | xargs printf '%.0f') -ge '25' ]]
then
	echo "$COLOR_DEGRADED"
# Color it yellow if temp above 60
elif [[ $(echo $temp | xargs printf '%.0f') -ge '60' ]]
then
	echo "$COLOR_DEGRADED"
else
	echo "$COLOR_NORMAL"
fi
