#!/bin/bash

sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot firefox vim xterm wget terminus-font

SRC_XINIT="/etc/X11/xinit/xinitrc"
DST_XINIT="$HOME/.xinitrc"

cp "$SRC_XINIT" "$DST_XINIT"

head -n -5 "$DST_XINIT" > "${DST_XINIT}.tmp" && mv "${DST_XINIT}.tmp" "$DST_XINIT"

# Download dwm and dmenu

SF="$HOME/suckless"
SF_DWM="$SF/dwm"
SF_DMENU="$SF/dmenu"
mkdir $SF $SF_DWM $SF_DMENU
git clone https://git.suckless.org/dwm $SF_DWM
git clone https://git.suckless.org/dmenu $SF_DMENU
# sudo make -C $SF_DWM clean install
# sudo make -C $SF_DMENU clean install

INSERTED_LINES="xrandr --output Virtual-1 --mode 1280x800 &
exec dwm"

{
	echo "$INSERTED_LINES"
} >> "$DST_XINIT"
