#!/bin/bash

name=tarsnap

tags=(-work)

check_install() {
  which tarsnap 2>&1 > /dev/null
}

install() {
  wget -O /tmp/tarsnap-deb-packaging-key.asc \
      https://pkg.tarsnap.com/tarsnap-deb-packaging-key.asc
  sudo apt-key add /tmp/tarsnap-deb-packaging-key.asc
  sudo sh -c 'echo "deb http://pkg.tarsnap.com/deb/$(lsb_release -s -c) ./" >> /etc/apt/sources.list.d/tarsnap.list'
  sudo apt-get update
  sudo apt-get install -y tarsnap
}
