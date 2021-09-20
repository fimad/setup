#!/bin/bash

name=virtualenv-pwn

tags=(ctf)

apt_deps=(
  python3
  virtualenvwrapper
)

check_install() {
  test -f ~/.virtualenvs/pwn3/bin/python
}

install() {
  (
    . /usr/share/virtualenvwrapper/virtualenvwrapper.sh ;
    mkvirtualenv -p /usr/bin/python3 pwn ;
  )
}