#!/bin/bash

name=neovim

apt_deps=(
  automake \
  cmake \
  git \
  libtool \
  libtool-bin \
  m4 \
  python-pip \
  python3-pip \
)

check_install() {
  test -d ~/.local/neovim
}

install() {
  mkdir /tmp/neovim
  git clone https://github.com/neovim/neovim /tmp/neovim
  (
    cd /tmp/neovim &&
    git checkout v0.2.0 &&
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim" &&
    make install
  )
  rm -Rf /tmp/neovim
  mkdir -p ~/.local/bin/
  ln -s ~/.local/neovim/bin/nvim ~/.local/bin/nvim
  pip install --user neovim
  pip3 install --user neovim
}
