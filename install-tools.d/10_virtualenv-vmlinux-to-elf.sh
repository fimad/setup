#!/bin/bash

name=virtualenv-pwntools

tags=(ctf)

check_install() {
  test -d ~/.virtualenvs/pwn/lib/*/site-packages/vmlinux_to_elf
}

install() {
  (
    . /usr/share/virtualenvwrapper/virtualenvwrapper.sh ;
    workon pwn ;
    pip install --upgrade lz4 git+https://github.com/marin-m/vmlinux-to-elf
  )
}