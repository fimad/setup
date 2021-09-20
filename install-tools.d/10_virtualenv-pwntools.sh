#!/bin/bash

name=virtualenv-pwntools

tags=(ctf)

check_install() {
  test -d ~/.virtualenvs/pwn3/lib/*/site-packages/pwnlib
}

install() {
  (
    . /usr/share/virtualenvwrapper/virtualenvwrapper.sh ;
    workon pwn ;
    pip install pwntools
  )
}