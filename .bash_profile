#!/bin/bash
#
# ~/.bash_profile

# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec sway

# Source ~/.bashrc
[ -n "$PS1" ] && source "$HOME"/.bashrc;
