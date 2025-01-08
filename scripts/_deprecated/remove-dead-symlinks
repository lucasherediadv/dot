#!/bin/bash
#
# Recursively remove dead symlinks

# Allow the use of ** for recursive globbing
shopt -s globstar

# Iterates over all files and directories in the current directory
for itm in **/*
do
  if [ -h "$itm" ]
  then
    target=$(readlink -fn "$itm")
    if [ ! -e "$target" ]
    then
      echo "$itm"
      rm "$itm"
    fi
  fi
done
