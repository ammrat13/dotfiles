#!/bin/bash

# Battery script for i3blocks
# Gets how much battery is remaining

source .config/i3blocks/scripts/colors.sh

# Get the values from /sys/class/power_supply
bat=$( \
	cat /sys/class/power_supply/BAT1/capacity \
)
isPlugged=$( \
	cat /sys/class/power_supply/ACAD/online \
)

# full_text
echo "BAT: $bat%"

# short_text
echo "BAT: $bat%"

# Color it green if charging
if [[ $isPlugged == '1' ]]
then
	echo "$COLOR_GOOD"
# Color it red if below 5%
elif [[ $bat -le '5' ]]
then
	echo "$COLOR_BAD"
# Color it yellow if below 20%
elif [[ $bat -le '20' ]]
then
	echo "$COLOR_DEGRADED"
else
	echo "$COLOR_NORMAL"
fi
