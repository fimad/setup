#!/bin/bash

name=fzf

apt_deps=(git)

check_install() {
  test -d ~/.fzf
}

install() {
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install
}
