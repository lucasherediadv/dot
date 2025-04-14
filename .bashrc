#!/bin/bash

# Interactive
case $- in
*i*) ;;
*) return ;;
esac

# Unset
unset HISTFILE
unalias -a
