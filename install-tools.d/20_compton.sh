#!/bin/bash

name=compton

apt_deps=(
  libconfig-dev \
  libdbus-1-dev \
  libgl1-mesa-dev \
  libpcre3-dev \
  libxcomposite-dev \
  libxdamage-dev \
  libxfixes-dev \
  libxinerama-dev \
  libxrender-dev \
  mesa-common-dev \
)

check_install() {
  test -f $HOME/.local/bin/compton
}

install() {
  git clone https://github.com/chjj/compton /tmp/compton
  ( cd /tmp/compton && make )
  cp /tmp/compton/compton $HOME/.local/bin/
  rm -Rf /tmp/compton
}
