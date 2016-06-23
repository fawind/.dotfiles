#!/bin/sh
#
# ~/.xinitrc
#

# Load .Xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Start applications
nm-applet --sm-disable &
dunst &
xfce4-power-manager &
redshift-gtk &
insync start &
unclutter &
urxvtd -q -f -o

xsetroot -solid "#282828"
xinput --disable 11

# Start WM
exec i3

# Start GNOME Keyring
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
