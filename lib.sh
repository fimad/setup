#!/bin/bash

function info {
  echo -e -n "[$(tput setaf 2)+$(tput sgr0)] "
  echo "$1"
}

function debug {
  echo -e -n "[$(tput setaf 4)-$(tput sgr0)$(tput bold)] $(tput sgr0)"
  echo "$1"
}

function warn {
  echo -e -n "[$(tput setaf 1)!$(tput sgr0)] "
  echo "$1"
}
