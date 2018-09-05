#!/bin/bash

name=tpm

apt_deps=(urlview)

check_install() {
  test -d ~/.tmux/plugins/tpm
}

install() {
  git clone \
    https://github.com/tmux-plugins/tpm \
    ~/.tmux/plugins/tpm
}

upgrade() {
  ( cd ~/.tmux/plugins/tpm/ && git pull )
}
