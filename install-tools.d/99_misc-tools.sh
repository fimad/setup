#!/bin/bash

name="misc tools"

apt_deps=(
  compton \
  dzen2 \
  hsetroot \
  rxvt-unicode-256color \
  stalonetray \
  suckless-tools \
  thunar \
  tmux \
  weechat \
)

check_install() {
  # Everything will be installed via apt_deps.
  true
}

install() {
  true
}
