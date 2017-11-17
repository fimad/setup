#!/bin/bash

. ./lib.sh

# First install all dependencies that are provided via apt.
all_apt_deps=()
for tool in install-tools.d/*
do
  tags=()
  apt_deps=()
  . ${tool}
  if tags_match tags tags
  then
    all_apt_deps=(${all_apt_deps[*]} ${apt_deps[*]})
  fi
done

dpkg -s "${all_apt_deps[@]}" > /dev/null 2> /dev/null
status_code="$?"
if [ "$status_code" -eq "0" ]
then
  info "Skipping apt dependencies"
else
  info "Installing apt dependencies"
  sudo apt-get install -y "${all_apt_deps[@]}"
fi


# Then go through each tool and proceed with the installation.

do_install() {
  info "Installing ${name}"
  # install
}

do_skip() {
  info "Skipping ${name}"
}

for tool in install-tools.d/*
do
  unset check_install
  unset install
  tags=()
  . ${tool}
  check_install()  {
    return 1
  }
  if tags_match tags
  then
    check_install && do_skip || do_install
  else
    do_skip
  fi
done
