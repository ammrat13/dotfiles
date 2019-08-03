#!/bin/bash

# Volume script for i3blocks
# Gets the volume from pacmd and outputs it with string manipulation

source .config/i3blocks/scripts/colors.sh

# The script is called by a realtime signal, but the change still has to be 
# processed by pulse. Wait for a second for that.
sleep .01

volume=$( \
	pacmd list-sinks \
		| grep -A8 '\*' \
		| grep 'volume' \
		| tr -d '[:blank:]' \
		| sed -e 's@^[^/]*/@@g' -e 's@/.*$@@g' \
		| xargs printf '%02d' \
)
muted=$( \
	pacmd list-sinks \
		| grep -A11 '\*' \
		| grep 'muted' \
		| tr -d '[:blank:]' \
		| sed -e 's@[^:]*:@@g' \
)

# full_text
if [[ $muted == 'yes' ]]
then
	echo "VOL: XX%"
else
	echo "VOL: $volume%"
fi

#short_text
if [[ $muted == 'yes' ]]
then
	echo "VOL: XX"
else
	echo "VOL: $volume%"
fi

# color
echo "$COLOR_NORMAL"
