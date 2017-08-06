#!/bin/bash

. ./lib.sh

do_install() {
  info "Installing ${name}"
  install
}

do_skip() {
  info "Skipping ${name}"
}


for tool in install-tools.d/*
do
  unset check_install
  unset install
  . ${tool}
  installed=$(check_install)
  check_install && do_skip || do_install
done

exit




# Old stuff, probably can be deleted


info "Compiling VIM plugin YouCompleteMe."
sudo apt-get install -y build-essential cmake python-dev
(cd ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer)
(cd ~/.vim/bundle/vimproc.vim && make)


info "Installing Conky dependencies."
sudo apt-get install -y \
  libtolua-dev libtolua++5.1-dev libx11-dev libxft-dev libxdamage-dev \
  libncurses5-dev libxinerama-dev

info "Installing Conky."
mkdir -p ${HOME}/Code/conky
(  cd ${HOME}/Code/ \
&& git clone https://github.com/brndnmtthws/conky.git . \
&& mkdir build \
&& cd build \
&& cmake .. \
&& make \
&& make DESTDIR=${HOME} install
)
v0.2.0
