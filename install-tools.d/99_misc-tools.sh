#!/bin/bash

name="misc tools"

check_install() {
  # apt-get is cheap, always try to install.
  false
}

install() {
  sudo apt-get install -y \
      compton \
      dzen2 \
      hsetroot \
      rxvt-unicode-256color \
      stalonetray \
      suckless-tools \
      thunar \
      tmux \
      weechat
}
