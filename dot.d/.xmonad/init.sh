#!/bin/sh

# Set up background.
hsetroot -solid "#002b36"

~/.xmonad/init.monitors.sh

IBUS_ENABLE_SYNC_MODE=1 ibus-daemon -xrd

# Disable the tap to click.
synclient TapButton1=0

pgrep nm-applet || nm-applet &

pgrep blueman-applet || blueman-applet &

pgrep stalonetray || stalonetray &

pgrep redshift || redshift -l '47.6647906:-122.3436361' &

~/.xmonad/init.irc.sh

~/.local/bin/xmobar -x 0
