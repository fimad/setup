#!/bin/bash

name="powerline fonts"

check_install(){
  test -f "$HOME/.local/share/fonts/Inconsolata for Powerline.otf"
}

install() {
  mkdir /tmp
  git clone https://github.com/powerline/fonts.git /tmp/fonts
  ( cd /tmp/fonts && ./install.sh )
  rm -Rf /tmp/fonts
}
