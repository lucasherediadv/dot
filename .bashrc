#!/bin/bash
# shellcheck disable=SC1090,SC1091

# Interactive
case $- in
*i*) ;;
*) return ;;
esac

# Local utility functions
_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# Environment variables
export LANG=en_US.UTF-8
export USER="${USER:-$(whoami)}"
export GITUSER="lucasherediadv"
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export PAGER=less
export LESS="-FXR"
export LESSHISTFILE=/dev/null

# Go environment variables
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/bin"
export GOROOT="/usr/lib/go"
export GOTELEMETRY=off
export GOPROXY=direct
export CGO_ENABLED=0

# CDPATH
export CDPATH=".:$HOME:$REPOS/github.com:$GHREPOS:$DOTFILES" # This defines where cd looks for targets

# Aliases
unalias -a
alias ls='ls --color=auto --human-readable --classify --group-directories-first'
alias c='printf "\e[H\e[2J"'
alias clear='printf "\e[H\e[2J"'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias du='du -h'
alias df='df -h'
alias free='free -h'
alias diff='diff --color=auto'
alias more='less'
alias me='cd $GHREPOS'
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias todo='$EDITOR ~/.todo'

# Editor related
set-editor() {
  export EDITOR="$1"
  export VISUAL="$1"
  export SUDO_EDITOR="$1"
  export GH_EDITOR="$1"
  export GIT_EDITOR="$1"
  alias vi="\$EDITOR"
}
_have "vim" && set-editor vim
_have "nvim" && set-editor nvim

# Bash options
shopt -s checkwinsize # Update window size after every command
shopt -s globstar 2> /dev/null # Turn on recursive globbing
shopt -s autocd 2> /dev/null # Prepend cd to directory names automatically
shopt -s dirspell 2> /dev/null # Correct spelling errors during tab-completion
shopt -s cdspell 2> /dev/null # Correct spelling errors in arguments supplied to cd
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob

# Disable control-s/control-q tty flow control
stty -ixon

# History
export HISTSIZE=500000
export HISTFILESIZE=100000
export HISTCONTROL="erasedups:ignoreboth" # Avoid duplicate entries
export HISTTIMEFORMAT='%F %T ' # Use standard ISO 8601 timestamp
export PROMPT_COMMAND='history -a' # Record each line as it gets issued

shopt -s histappend # Append to the history file, don't overwrite it
shopt -s cmdhist # Save multi-line commands as one command

# Path
pathappend() {
  declare arg
  for arg in "$@"; do
      test -d "$arg" || continue
      PATH=${PATH//":$arg:"/:}
      PATH=${PATH/#"$arg:"/}
      PATH=${PATH/%":$arg"/}
      export PATH="${PATH:+"$PATH:"}$arg"
  done
} && export -f pathappend

pathappend \
  "$GOROOT/bin" \
  "$SCRIPTS" \
  "$GOBIN"

# Functions
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

# Source external dependencies / completion
_source_if "/usr/share/bash-completion/bash_completion"
_have gh && . <(gh completion -s bash)
_have glow && . <(glow completion bash)
_source_if "$HOME/.bash_private"
