#!/bin/bash

. ./lib.sh

# Find tagged dot directories that match the current environment.
matched_tag_dots=(./dot.d)
for tag_dot in $(find . -mindepth 1 -maxdepth 1 -type d -name 'dot.tag.*.d')
do
  tags=($(echo "$tag_dot" | sed -r 's/.*dot\.tag\.(.*)\.d$/\1/g'))
  if tags_match tags
  then
    matched_tag_dots=(${matched_tag_dots[*]} $tag_dot)
  fi
done

info "Creating directories"
for dot in "${matched_tag_dots[@]}"
do
  for file in $(find "$dot" -mindepth 1 -type d |
                egrep -v '/\.git(/|$)' |
                sed "s#^${dot}/##g")
  do
    debug "  $file"
    mkdir -p "$HOME/$file"
  done
done

info "Creating symlinks"
for dot in "${matched_tag_dots[@]}"
do
  for file in $(find "$dot" -mindepth 1 -type f -or -type l |
                egrep -v '/\.git/' |
                sed "s#^${dot}/##g")
  do
    if [ -f "dot.host.$(hostname -s).d/$file" ]
    then
      notes=" (host override)"
      target="$(pwd)/dot.host.$(hostname -s).d/$file"
    else
      notes=""
      target="$(pwd)/${dot}/$file"
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
done
