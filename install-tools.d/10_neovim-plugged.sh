#!/bin/bash

name=neovim-plug

apt_deps=(curl)

check_install() {
  test -f ~/.local/share/nvim/site/autoload/plug.vim
}

install() {
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}
