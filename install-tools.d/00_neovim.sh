#!/bin/bash

name=neovim

check_install() {
  test -d ~/.local/neovim
}

install() {
  sudo apt-get install -y \
      automake \
      cmake \
      libtool \
      libtool-bin \
      m4 \
      python-pip \
      python3-pip
  git clone https://github.com/neovim/neovim /tmp/neovim
  ( 
    cd /tmp/neovim &&
    git checkout v0.2.0 &&
    make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim" &&
    make install
  )
  rm -Rf /tmp/neovim
  ln -s ~/.local/neovim/bin/nvim ~/.local/bin/nvim
  pip install neovim
  pip3 install neovim
}
