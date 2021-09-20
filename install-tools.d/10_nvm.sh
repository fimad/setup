#!/bin/bash

name=nvm

tags=(
  -ctf
  -work
)

apt_deps=(git)

check_install() {
  test -d ~/.nvm
}

nvm_version="v0.33.9"

install() {
  git clone https://github.com/creationix/nvm ~/.nvm
  git checkout "$nvm_version"
  zsh -c ". ~/.zshrc && nvm install --lts"
}

upgrade() {
  ( cd ~/.nvm && git fetch origin && git checkout "$nvm_version" )
}
