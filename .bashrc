#!/bin/bash
# shellcheck disable=SC1090,SC1091

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# local utility function
_have() { type "$1" &>/dev/null; }

# use vi commands
set -o vi

# prompt
__ps1() {
  local P='$' dir="${PWD##*/}" B

  [[ $EUID == 0 ]] && P='#' 
  [[ $PWD = / ]] && dir='/'
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.
  [[ -n "$B" && ($B == master || $B == main) ]] && B="─[$B]"

  PS1="┌[\u@\h]─[$dir]$B\n└$P "
}

PROMPT_COMMAND="__ps1"

# environment variables
unset HISTFILE
export REPOS="$HOME/Repos"
export GITUSER="lucasherediadv"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOT="$GHREPOS/dot"
export SCRIPTS="$DOT/scripts"
export BROWSER=firefox
export LESSHISTFILE=/dev/null

# path
case ":$PATH:" in
  *":$SCRIPTS:"*) ;;
  *) export PATH="${PATH:+"$PATH;"}$SCRIPTS" ;;
esac

# bash shell options
shopt -s checkwinsize # enables $COLUMNS and $ROWS
shopt -s expand_aliases # ensures that aliases are expanded even in non-interactive shells
shopt -s globstar
shopt -s dotglob
shopt -s extglob

# stty annoyances
stty -ixon # disable control-s/control-q tty flow control

# aliases
unalias -a
alias ls='ls -h --color=auto'
alias repos='cd $GHREPOS'
alias scripts='cd $SCRIPTS'
alias dot='cd $DOT'
alias todo='$EDITOR ~/.todo'

set-editor() {
  export EDITOR="$1"
  export VISUAL="$1"
  export GH_EDITOR="$1"
  export GIT_EDITOR="$1"
  alias vi="\$EDITOR"
}

_have "vim" && set-editor vim
_have "nvim" && set-editor nvim

# source external dependencies / completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
  . /usr/share/bash-completion/bash_completion
fi
