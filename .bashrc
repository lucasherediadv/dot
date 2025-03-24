#!/bin/bash
# shellcheck disable=SC1090,SC1091

case $- in
*i*) ;; # interactive
*) return ;;
esac

# local utility functions
_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# prompt
if _have "starship"; then
  export STARSHIP_CONFIG=~/.config/starship/starship.toml
  eval "$(starship init bash)"
else
  __ps1() {
    local dir="${PWD##*/}" B
    local P='>' dir="${PWD##*/}" B

    [[ $EUID == 0 ]] && P='#'
    [[ $PWD = / ]] && dir='/'
    [[ $PWD = "$HOME" ]] && dir='~'

    B=$(git branch --show-current 2>/dev/null)
    [[ $dir = "$B" ]] && B=.
    [[ -n "$B" ]] && B="─[$B]"

    PS1="┌─[\u@\h]─[$dir]$B\n└──$P "
  }

  PROMPT_COMMAND="__ps1; history -a"
fi

# environment variables
export PAGER="less"
export LESS="-FXR"
export LESSHISTFILE="/dev/null"
export REPOS="$HOME/repos"
export GITUSER="lucasherediadv"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOT="$GHREPOS/dot"
export SCRIPTS="$DOT/scripts"
export GOTELEMETRY=off
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# history
export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTTIMEFORMAT='%F %T ' # Use standard ISO 8601 timestamp
export HISTIGNORE="&:[ ]*:exit:ls:ls -a:bg:fg:history:clear:c" # Don't record some commands
set -o vi
shopt -s cmdhist # Save multi-line commands as one command
shopt -s histappend # Append to the history file, don't overwrite it

# better cd
export CDPATH=".:$HOME:$REPOS/github.com:$GHREPOS:$DOT"
shopt -s dirspell 2> /dev/null # Correct spelling errors during tab-completion
shopt -s cdspell 2> /dev/null # Correct spelling errors in arguments supplied to cd

# path
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
  "$SCRIPTS" \
  "$GOBIN"

# bash/shell options
shopt -s checkwinsize # Update window size after every command
shopt -s globstar 2> /dev/null # Turn on recursive globbing (enables ** to recurse all directories)
set -o noclobber # Prevent file overwrite on stdout redirection. Use ">|" to force redirection to an existing file

# aliases
unalias -a
alias todo='$EDITOR ~/.todo.md'
alias to='cat ~/.todo.md'
alias gs='git status'
alias gitl='git log -n 5 --graph --decorate --oneline'
alias lastmod='find . -type f -not -path "*/\.*" -exec ls -lhrt {} +'
alias btm='btm --tree --disable_click --hide_table_gap --celsius'
alias ls='eza --long --all --all --classify --git --git-repos --header --icons=auto --color=auto --group-directories-first'
alias cat='bat --theme-dark=gruvbox-dark --paging=never'
alias tree='eza --tree'

# If ZELLIJ is set, use the standard 'clear' command
if [ -n "$ZELLIJ" ]; then
  alias c='clear'
else
  # Otherwise, use escape sequences for clearing the terminal
  alias c='printf "\e[H\e[2J"'
  alias clear='printf "\e[H\e[2J"'
fi

# editor configuration
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
_source_if "/usr/share/bash_completion/bash_completion" # bash completion
_have "fzf" && eval "$(fzf --bash)" # set up fzf key bindings and fuzzy completion
