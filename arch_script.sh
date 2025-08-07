#!/bin/bash

sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot firefox vim i3 xterm

SRC_DIR="/etc/X11/xinit"
DST_DIR="/home/oleg"
FNAME="xinitrc"
HFNAME=".xinitrc"

SRC_FILE="$SRC_DIR/$FNAME"
DST_FILE="$DST_DIR/$HFNAME"

cp "$SRC_FILE" "$DST_FILE"

head -n -5 "$DST_FILE" > "${DST_FILE}.tmp" && mv "${DST_FILE}.tmp" "$DST_FILE"

INSERTED_LINES="xrandr --output Virtual-1 --mode 1280x800 &
exec i3"

{
	echo "$INSERTED_LINES"
} >> "$DST_FILE"
