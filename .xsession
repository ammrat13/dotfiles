# Source .Xresources if it exists
if [[ -f ~/.Xresources ]]; then
	xrdb -merge -I$HOME ~/.Xresources
fi

# Start pulseaudio in case it fails
pulseaudio --start
# Start compton for saturation effects
compton --paint-on-overlay &

# Set desktop background
feh --no-fehbg --bg-scale ~/wallpaper.jpg
# Disable screensaver
xset s off
xset -dpms
