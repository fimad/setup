#!/bin/bash

name=xmonad

tags=(-tui)

apt_deps=(
  libasound2-dev \
  libxft-dev \
  libxpm-dev \
  libxrandr-dev \
  libxss-dev \
)

check_install() {
  test -f $HOME/.local/bin/xmonad
}

install() {
  stack install \
      --flag xmonad-contrib:use_xft \
      --flag xmobar:with_xft \
      --flag xmobar:with_xpm \
      --flag xmobar:with_alsa \
      alex happy xmonad xmonad-contrib xmobar
  (cd "$HOME/.xmonad/" && ./build "$HOME/.local/bin/xmonad")
}
