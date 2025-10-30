#!/bin/bash
# shellcheck disable=SC1090,SC1091

case $- in
*i*) ;; # Interactive
*) return ;;
esac

# ---------------------- Local utility functions ---------------------

_have() { command -v "$1" &>/dev/null; }
_source_if() { test -r "$1" && source "$1"; }

# ----------------------- Environment variables ----------------------

export USER="${USER:-$(whoami)}"
export GITUSER="$USER"
export REPOS="$HOME/repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export ZETTELKASTEN="$GHREPOS/zet"

# Pager
export PAGER=less
export LESS="-FXR"
export SYSTEMD_LESS="-FRXMK"
export LESSHISTFILE=/dev/null

# Go
export CGO_ENABLED=0
export GOPROXY=direct
export GOTELEMETRY=off

# CDPATH
export CDPATH=".:$GHREPOS:$DOTFILES:$REPOS:$HOME"

# ------------------------------- Path -------------------------------

pathappend() {
  declare arg
  for arg in "$@"; do
      test -d "$arg" || continue
      PATH=${PATH//":$arg:"/:}
      PATH=${PATH/#"$arg:"/}
      PATH=${PATH/%":$arg"/}
      export PATH="${PATH:+"$PATH:"}$arg"
  done
}

pathappend \
  "$GOBIN" \
  "$SCRIPTS"

# ------------------------ Bash shell options ------------------------

shopt -s checkwinsize globstar dotglob extglob

# -------------------------- stty annoyances -------------------------

stty -ixon # Disable control-s/control-q tty flow control

# ------------------------------ History -----------------------------

export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth

set -o vi
shopt -s histappend

# ------------------------------ Aliases -----------------------------

unalias -a
alias free='free -h'
alias ip='ip --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias clear='printf "\e[H\e[2J"'
alias ls='ls -hF --color=auto --group-directories-first'

# ------------------------------ Editor ------------------------------

set-editor() {
  export EDITOR="$1"
  export VISUAL="$1"
  export SUDO_EDITOR="$1"
  export GH_EDITOR="$1"
  export GIT_EDITOR="$1"
  alias vi="\$EDITOR"
}

_have "vi" && set-editor vi
_have "vim" && set-editor vim

# ----------------------------- Functions ----------------------------

clone() {
  local repo="$1" user
  local repo="${repo#https://github.com/}"
  local repo="${repo#git@github.com:}"
  if [[ $repo =~ / ]]; then
    user="${repo%%/*}"
  else
    user="$GITUSER"
    [[ -z "$user" ]] && user="$USER"
  fi
  local name="${repo##*/}"
  local name="${name%.git}"
  local userd="$REPOS/github.com/$user"
  local path="$userd/$name"
  [[ -d "$path" ]] && cd "$path" && return
  mkdir -p "$userd"
  cd "$userd"
  echo gh repo clone "$user/$name" -- --recurse-submodule
  gh repo clone "$user/$name" -- --recurse-submodule
  cd "$name"
} && export -f clone

# ------------- Source external dependencies / Completion ------------

_source_if "$HOME/.bash_private"
_source_if "/usr/share/bash-completion/bash_completion"
