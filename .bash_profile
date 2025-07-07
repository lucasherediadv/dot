#!/bin/bash
# shellcheck disable=SC1090

# if running from tty1 start sway
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
  exec sway
fi

# source ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
