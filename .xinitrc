#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/* ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# twm
#
# twm &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
# exec xterm -geometry 80x66+0+0 -name login

# parcellite -dn &

export DE=kde  # xfce

# iBus
#
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
ibus-daemon -n kde -rR &

# archwall_color=$(case $(($RANDOM % 9)) in
#   0) echo "dark_blue"   ;;
#   1) echo "dark_green"  ;;
#   2) echo "dark_orange" ;;
#   3) echo "dark_pink"   ;;
#   4) echo "dark_purple" ;;
#   5) echo "dark_red"    ;;
#   6) echo "dark_toxic"  ;;
#   7) echo "dark_yellow" ;;
#   8) echo "light_blue"  ;;
# esac)
# feh --bg-fill $(echo ".wallpapers/Arch/archwall_$archwall_color.png") &

# i3 WM
#
# thunar --daemon &
# exec ck-launch-session dbus-launch i3

# FLWM
#
# flwm &
# WindowManager=$!
# wait $WindowManager

# Xfce
#
# exec startxfce4 --with-ck-launch

# KDE
#
exec startkde

