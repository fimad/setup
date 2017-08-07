#!/bin/sh

# Set up background.
hsetroot -solid "#002b36"

IBUS_ENABLE_SYNC_MODE=1 ibus-daemon -xrd

# Disable the tap to click.
synclient TapButton1=0

killall nm-applet
nm-applet &

killall stalonetray
stalonetray &

killall redshift
redshift -l 37.7833:122.4167 &

killall dzen2
ghc \
  $HOME/.xmonad/bin/irc-status-bar.hs \
  -o $HOME/.xmonad/bin/irc-status-bar 2> ~/.xmonad/irc-status-bar.errors
$HOME/.xmonad/bin/irc-status-bar \
  '#greatestguys' \
  "$HOME/.weechat/logs/irc.freenode-direct.#greatestguys.weechatlog" \
  'will:' '@will' 'fimad' 2>> ~/.xmonad/irc-status-bar.errors \
  &

# Comptom is now started via ~/.xsession. For some reason it needs to be started
# before xmonad in order for it to be aware of the active window.

# -c  enable shadows
# -f  fade windows in and out
# -o  shadow opacity
# -I  opacity step for fading in
# -I  opacity step for fading out
# -C  don't draw shadows for docks
# -z  zero the shadow behind windows
# -b  run in background
# -D  time between fade steps
# compton --inactive-dim 0.2 --backend glx
#compton \
#  -b \
#  -c \
#  --inactive-dim 0.2 \
#  --vsync opengl-swc  --paint-on-overlay --backend glx \
#  --use-ewmh-active-win --glx-no-stencil \
#  --focus-exclude "name~='dzen title'" \
#  --shadow-exclude "name~='.*'" 

# xmobar must be last and must be left in the foreground so that it can
# communicate with xmonad over a pipe.
xmobar -x 1
