#!/bin/sh
 
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# Merge in defaults and keymaps

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

# Load dream xkbmap
#
#xkbcomp -I$HOME/.xkb ~/.xkb/keymap/dreamkm $DISPLAY 2> /dev/null

setxkbmap de -variant nodeadkeys -option ctrl:swapcaps

xsetroot -cursor_name left_ptr

# Start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/* ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Set input methods

# IBus
#
export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
ibus-daemon -rR &

# SCIM
#
# export XMODIFIERS="@im=SCIM"
# export GTK_IM_MODULE=scim
# export QT_IM_MODULE=scim
# scim -d &

# FCITX
#
#export XMODIFIERS="@im=fcitx"
#export GTK_IM_MODULE=fcitx
#export QT_IM_MODULE=fcitx
#fcitx -r &

# URxvt daemon

urxvtd &

# Choose a window manager or a desktop system

exec $(case $WM in
  cwm)     cwm;;
  e)       englightment_start;;
  goomwwm) goomwwm;;
  gnome)   gnome-session;;
  i3)      i3;;
  kde)     startkde;;
  xfce)    startxfce4;;
  xmonad)  xmonad;;
esac)

