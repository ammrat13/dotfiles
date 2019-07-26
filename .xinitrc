# Source .Xresources if it exists
if [[ -f ~/.Xresources ]]; then
	xrdb -merge -I$HOME ~/.Xresources
fi

# Start pulseaudio in case it fails
pulseaudio --start
# Start compton for saturation effects
compton &
# Set desktop background
feh --bg-scale ~/wallpaper.png
# Disable screensaver
xset s off
xset -dpms

exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
