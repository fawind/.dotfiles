#!/bin/sh
#
# ~/.xinitrc
#

# Start applications
nm-applet --sm-disable &
dunst &
xfce4-power-manager &
redshift-gtk &
insync start &

# Start WM
exec i3

# Start GNOME Keyring
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
