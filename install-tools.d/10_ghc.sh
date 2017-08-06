#!/bin/bash

name=ghc

check_install() {
  test -f $HOME/.local/bin/ghc
}

install() {
  echo '#!/bin/bash' > $HOME/.local/bin/ghc
  echo 'stack ghc -- $@' >> $HOME/.local/bin/ghc
  chmod +x $HOME/.local/bin/ghc
}
