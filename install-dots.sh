#!/bin/bash

. ./lib.sh

info "Creating directories"
for file in $(find dot.d -mindepth 1 -type d | sed 's!^dot.d/!!g')
do
  debug "  $file"
  mkdir -p "$HOME/$file"
done

info "Creating symlinks"
for file in $(find dot.d -mindepth 1 -type f -or -type l | sed 's!^dot.d/!!g')
do
  if [ -f "dot.$(hostname -s).d/$file" ]
  then
    notes=" (host override)"
    target="$(pwd)/dot.$(hostname -s).d/$file"
  else
    notes=""
    target="$(pwd)/dot.d/$file"
  fi
  debug "  $file$notes"
  if [ -f "$HOME/$file" -a ! -h "$HOME/$file" ]
  then
    debug "    Backing up as ${file}.bak"
    mv "$HOME/$file" "$HOME/$file.bak"
  elif [ -h "$HOME/$file" ]
  then
    rm "$HOME/$file"
  fi
  ln -s "$target" "$HOME/$file"
done
