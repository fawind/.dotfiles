#!/bin/sh
#
# ~/.xinitrc
#

# Load .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I $HOME ~/.Xresources

# Start applications
nm-applet &
dunst &
xfce4-power-manager &
redshift-gtk &
unclutter &
insync start &

# Background color
xsetroot -solid "#282828"

# Keyboard layout
setxkbmap -layout us -variant altgr-intl -option nodeadkeys -option ctrl:nocaps
# Disable trackpad
device=`xinput | grep Synaptics | grep -o "id=.." | grep -o "[0-9]*"`
xinput --disable $device

# Start WM
exec i3

# Start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
