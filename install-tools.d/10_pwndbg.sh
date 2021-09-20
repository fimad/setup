#!/bin/bash

name=pwndbg

tags=(ctf)

check_install() {
  test -d ~/Code/pwndbg
}

install() {
  git clone https://github.com/pwndbg/pwndbg.git ~/Code/pwndbg
  (
    . /usr/share/virtualenvwrapper/virtualenvwrapper.sh ;
    workon pwn ;
    cd ~/Code/pwndbg ;
    ./setup.sh
  )
}

upgrade() {
  cd ~/Code/pwndbg && git pull
}