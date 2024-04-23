#!/bin/bash

# If running from tty1 start sway.
if [ "$(tty)" = "/dev/tty1" ] ; then
  export QT_QPA_PLATFORM=wayland
  export XDG_SESSION_TYPE=wayland
  export XDG_CURRENT_DESKTOP=sway
  exec sway
fi

# Source ~/.bashrc.
[ -n "$PS1" ] && source "$HOME"/.bashrc;

