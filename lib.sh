#!/bin/bash

function info {
  echo -e -n "$(tput bold)[$(tput setaf 2)+$(tput sgr0)$(tput bold)] "
  echo "$1"
  echo -e -n "$(tput sgr0)"
}

function debug {
  echo -e -n "$(tput bold)[$(tput setaf 4)-$(tput sgr0)$(tput bold)] $(tput sgr0)"
  echo "$1"
}

function warn {
  echo -e -n "$(tput bold)[$(tput setaf 1)!$(tput sgr0)$(tput bold)] "
  echo "$1"
  echo -e -n "$(tput sgr0)"
}
