#!/bin/bash

name=oh-my-zsh

apt_deps=(git zsh)

check_install() {
  test -d ~/.oh-my-zsh
}

install() {
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  chsh -s /bin/zsh
}
