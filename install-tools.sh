#!/bin/bash

. ./lib.sh

# The arguments supplied to this script are a set of tags that describe the
# environment that is being setup.
user_tags=("${BASH_ARGV[@]}")

tags_match() {
  for tag in "${tags[@]}"
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

# First install all dependencies that are provided via apt.
all_apt_deps=()
for tool in install-tools.d/*
do
  tags=()
  apt_deps=()
  . ${tool}
  if tags_match
  then
    all_apt_deps=(${all_apt_deps[*]} ${apt_deps[*]})
  fi
done

dpkg -s "${all_apt_deps[@]}" > /dev/null 2> /dev/null
status_code="$?"
if [ "$status_code" -eq "0" ]
then
  info "Skipping apt dependencies"
else
  info "Installing apt dependencies"
  sudo apt-get install -y "${all_apt_deps[@]}"
fi


# Then go through each tool and proceed with the installation.

do_install() {
  info "Installing ${name}"
  install
}

do_skip() {
  info "Skipping ${name}"
}

for tool in install-tools.d/*
do
  unset check_install
  unset install
  tags=()
  . ${tool}
  if tags_match
  then
    check_install && do_skip || do_install
  else
    do_skip
  fi
done
