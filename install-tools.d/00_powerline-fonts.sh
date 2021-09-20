#!/bin/bash

name="powerline fonts"

tags=(-tui)

apt_deps=(git)

check_install(){
  test -f "$HOME/.local/share/fonts/Inconsolata for Powerline.otf"
}

install() {
  mkdir /tmp
  git clone https://github.com/powerline/fonts.git /tmp/fonts
  ( cd /tmp/fonts && ./install.sh )
  rm -Rf /tmp/fonts
}
