#!/bin/bash

. ./lib.sh

for setup in setup.d/*
do
  . ${setup}
  info "Setting up $name"
  do_setup
done
