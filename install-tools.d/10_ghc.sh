#!/bin/bash

name=ghc

tags=(-tui)

check_install() {
  test -f $HOME/.local/bin/ghc
}

install() {
  echo '#!/bin/bash' > $HOME/.local/bin/ghc
  echo 'stack setup 2> /dev/null > /dev/null' >> $HOME/.local/bin/gh
  echo 'stack ghc -- $@' >> $HOME/.local/bin/ghc
  chmod +x $HOME/.local/bin/ghc
}
