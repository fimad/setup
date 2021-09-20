#!/bin/bash

name=docker-machine

tags=(
  -ctf
  -work
)

check_install() {
  test -f ~/.local/bin/docker-machine
}

install() {
  curl -L \
    "https://github.com/docker/machine/releases/download/v0.14.0/docker-machine-$(uname -s)-$(uname -m)" \
    > $HOME/.local/bin/docker-machine
  chmod +x $HOME/.local/bin/docker-machine
}
