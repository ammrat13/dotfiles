# Source .Xresources if it exists
if [[ -f ~/.Xresources ]]; then
	xrdb -merge -I$HOME ~/.Xresources
fi

# Start pulseaudio before i3
systemctl --user start pulseaudio
# Start compton for saturation effects
compton &

# Scale the display
xrandr --output eDP1 --scale .8333333x.8333333
# Set desktop background
feh --no-fehbg --bg-scale ~/wallpaper.jpg
# Disable screensaver
xset s off
xset -dpms

# Set volume and brightness
xbacklight -set 80
~/.config/i3/pavolume 40%
