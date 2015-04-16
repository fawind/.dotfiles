#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset -b
xfce4-panel &

xbindkeys
synclient TouchpadOff=1
xsetroot -cursor_name left_ptr
feh --bg-tile ~/Media/Wallpaper/bg.png

# autostart
#xfce4-panel &
compton &
xfce4-power-manager &
nm-applet --sm-disable &
pnmixer &
insync start &
redshift-gtk & 

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

exec openbox-session
#exec 2bwm

# enable GNOME Keyring
# start D-Bus session
source /etc/X11/xinit/xinitrc.d/30-dbus
# start GNOME Keyring
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GPG_AGENT_INFO SSH_AUTH_SOCK
