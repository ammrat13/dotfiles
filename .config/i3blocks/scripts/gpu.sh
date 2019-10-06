#!/bin/bash

# GPU script for i3blocks
# Gets the gpu temperature

source .config/i3blocks/scripts/colors.sh

# Get the value from lm_sensors
temp=$( \
	sensors \
		| grep -A 5 'amdgpu' \
		| grep 'edge' \
		| awk '{print $2}' \
		| sed -e 's/^.//g' -e 's/..$//g' \
)

# full_text
echo "GPU: $temp°C"

# short_text
echo "GPU: $temp°C"

# Color it red if temp above 70
if [[ $(echo $temp | xargs printf '%.0f') -ge '70' ]]
then
	echo "$COLOR_BAD"
# Color it yellow if temp above 60
elif [[ $(echo $temp | xargs printf '%.0f') -ge '60' ]]
then
	echo "$COLOR_DEGRADED"
else
	echo "$COLOR_NORMAL"
fi
