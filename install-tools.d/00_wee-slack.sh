#!/bin/bash

name=wee-slack

apt_deps=(python-websocket)

check_install() {
  test -f ~/.weechat/python/autoload/wee_slack.py
}

install() {
  mkdir -p ~/.weechat/python/autoload
  wget \
    https://raw.githubusercontent.com/wee-slack/wee-slack/master/wee_slack.py \
    -O ~/.weechat/python/autoload/wee_slack.py
}

