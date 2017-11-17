#!/bin/bash

name=nvm

tags=(-work)

apt_deps=(git)

check_install() {
  test -d ~/.nvm
}

install() {
  git clone https://github.com/creationix/nvm ~/.nvm
  zsh -c ". ~/.zshrc && nvm install --lts"
}
