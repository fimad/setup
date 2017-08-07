#!/bin/bash

name=xmonad

apt_deps=(
  libxrandr-dev \
  libxft-dev \
  libxpm-dev \
  libasound2-dev \
)

check_install() {
  test -f $HOME/.local/bin/xmonad
}

install() {
  stack install \
      --flag xmonad-contrib:with_xft \
      --flag xmobar:with_xft \
      --flag xmobar:with_xpm \
      --flag xmobar:with_alsa \
      alex happy xmonad xmonad-contrib xmobar
}
