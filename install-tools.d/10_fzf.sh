#!/bin/bash

name=fzf

apt_deps=(git silversearcher-ag)

check_install() {
  test -d ~/.fzf
}

install() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}
