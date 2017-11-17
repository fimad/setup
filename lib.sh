#!/bin/bash

function info {
  echo -e -n "[$(tput setaf 2)+$(tput sgr0)] "
  echo "$1"
}

function debug {
  echo -e -n "[$(tput setaf 4)-$(tput sgr0)$(tput bold)] $(tput sgr0)"
  echo "$1"
}

function warn {
  echo -e -n "[$(tput setaf 1)!$(tput sgr0)] "
  echo "$1"
}

# The arguments supplied to this script are a set of tags that describe the
# environment that is being setup.
user_tags=("${BASH_ARGV[@]:1}")

# Also load additional tags based on the hostname as well.
host_tags_file="./tags.d/$(hostname -s)"
if [ -f "$host_tags_file" ]
then
  host_tags=$(cat "$host_tags_file")
  user_tags=(${user_tags[*]} "$host_tags")
fi

tags_match() {
  local -n _tags=$1
  for tag in "${_tags[@]}"
  do
    if [ "${tag:0:1}" != "-" ]
    then
      # Handle positively matching tags. If a tag in the list is positive, then
      # that tag must be present in the list of user-tags for the matching to
      # succeed.
      local ok=0
      for user_tag in "${user_tags[@]}"
      do
        if [ "${user_tag}" == "$tag" ]
        then
          ok=1
        fi
      done
      if [ "$ok" == "0" ]
      then
        return 1
      fi
    else
      # Handle negatively matching tags. If a tag in the list is negative, then
      # the matching will succeed as long as the normalized form of the tag is
      # not present in the list of user tags.
      for user_tag in "${user_tags[@]}"
      do
        if [ "-${user_tag}" == "$tag" ]
        then
          return 1
        fi
      done
    fi
  done
  return 0
}
