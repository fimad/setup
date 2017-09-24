#!/bin/bash

name=stack

check_install() {
  test -f /usr/local/bin/stack || test -f /usr/bin/stack
}

install() {
  curl -sSL https://get.haskellstack.org/ | sh
  stack setup
}
