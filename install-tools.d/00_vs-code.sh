#!/bin/bash

name=code

check_install() {
  test -f /snap/bin/code
}

install() {
  sudo snap install --classic code
}

upgrade() {
  sudo snap refresh code
}