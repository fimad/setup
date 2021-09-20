#!/bin/sh

killall dzen2
ghc \
  $HOME/.xmonad/bin/irc-status-bar.hs \
  -o $HOME/.xmonad/bin/irc-status-bar 2> ~/.xmonad/irc-status-bar.errors
$HOME/.xmonad/bin/irc-status-bar \
  '#greatestguys' \
  "$HOME/.weechat/logs/irc.halfling.#greatestguys.weechatlog" \
  'will:' '@will' 'fimad' 2>> ~/.xmonad/irc-status-bar.errors \
  &
