#!/bin/bash

sudo apt-get install git
mkdir -p ~/Code
cd ~/Code
git clone https://github.com/fimad/setup.git
cd setup
./install-dots.sh "$@"
./install-tools.sh "$@"
./setup.sh
