#!/bin/bash

sudo apt-get install git
mkdir -p Code
cd ~/Code
echo git clone https://github.com/fimad/setup.git
cd setup
echo ./install-tools.sh
echo ./install-dots.sh
echo ./setup.sh
