#!/bin/bash

# The amount of of minutes of idle to wait before locking the screen.
lock_screen_timeout_minutes=120

# When to display the notification to the user that the screen is about to be
# put to sleep.
message_timeout_seconds=10
message="Locking screen in $message_timeout_seconds seconds..."

# Allow for overriding just the above settings.
.  ~/.xmonad/init.lock.settings.sh

killall xautolock
xautolock \
  -time "$lock_screen_timeout_minutes" \
  -locker "dm-tool lock" \
  -notify "$message_timeout_seconds" \
  -notifier "notify-send -t 10000 -i gtk-dialog-info '$message'" &
