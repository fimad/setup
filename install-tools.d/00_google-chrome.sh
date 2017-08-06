#!/bin/bash

name=google-chrome

check_install() {
  which google-chrome > /dev/null
}

install() {
  # Setup Google's signing key.
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 

  # Add an entry in source.list.d
  sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

  # Update and install.
  sudo apt-get update 
  sudo apt-get install -y google-chrome
}
