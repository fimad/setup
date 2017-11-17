#!/bin/sh

# Set up background.
hsetroot -solid "#002b36"

~/.xmonad/init.monitors.sh

IBUS_ENABLE_SYNC_MODE=1 ibus-daemon -xrd

# Disable the tap to click.
synclient TapButton1=0

killall nm-applet
nm-applet &

killall blueman-applet
blueman-applet &

killall stalonetray
stalonetray &

~/.xmonad/init.irc.sh

xmobar -x 0
