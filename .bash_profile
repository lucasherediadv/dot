#!/bin/bash
# shellcheck disable=SC1090

# If running from tty1 start sway
if [ -z "$WAYLAND_DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ] ; then
  exec sway
fi

# Source ~/.bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc
