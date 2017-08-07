#!/bin/bash

. ../lib.sh

name=github

do_setup() {
  info "Creating RSA key, press enter at the prompts."
  ssh-keygen -t rsa -b 4097 -C "willcoster@gmail.com"
  info "Please add the following key to GitHub."
  cat ~/.ssh/id_rsa.pub
  read
}
