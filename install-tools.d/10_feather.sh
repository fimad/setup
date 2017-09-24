#!/bin/bash

name=feather

apt_deps=(python-yaml)

check_install() {
  test -f ~/.local/bin/feather
}

install() {
  git clone https://github.com/danrue/feather.git ~/.local/feather
  ln -s ~/.local/feather/feather ~/.local/bin/feather
  mkdir -p ~/.local/logs
}
