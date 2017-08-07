#!/usr/bin/env bash

compton --inactive-dim 0.2 --backend glx &

exec xmonad
