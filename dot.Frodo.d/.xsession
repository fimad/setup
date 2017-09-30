#!/usr/bin/env bash

xrdb -merge ~/.Xdefaults

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
~/.local/bin/compton --inactive-dim 0.2 --backend glx &

steam -bigpicture &

exec ~/.local/bin/xmonad
