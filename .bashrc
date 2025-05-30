#!/bin/bash
# shellcheck disable=SC1090,SC1091

# Interactive
case $- in
*i*) ;;
*) return ;;
esac

# Environment variables
export LANG=en_US.UTF-8
export GITUSER="lucasherediadv"
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export SCRIPTS="$DOTFILES/scripts"
export GOPATH="$HOME/.local/go"
export GOBIN="$HOME/.local/bin"
export PAGER=less
export LESS="-FXR"
export PROMPT_COMMAND='history -a' # Record each line as it gets issued
export VISUAL=vim
export EDITOR=vim
export GOTELEMETRY=off
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export HISTSIZE=500000
export HISTFILESIZE=100000
export HISTCONTROL="erasedups:ignoreboth" # Avoid duplicate entries
export HISTTIMEFORMAT='%F %T ' # Use standard ISO 8601 timestamp
export CDPATH=".:$HOME:$GHREPOS:$DOTFILES" # This defines where cd looks for targets

# Aliases
unalias -a
alias vi='vim'
alias ls='ls --color=auto --human-readable --classify --group-directories-first'
alias c='clear'
alias me='cd $GHREPOS'
alias dot='cd $DOTFILES'

# Bash options
shopt -s histappend # Append to the history file, don't overwrite it
shopt -s cmdhist # Save multi-line commands as one command
shopt -s checkwinsize # Update window size after every command
shopt -s globstar 2> /dev/null # Turn on recursive globbing
shopt -s autocd 2> /dev/null # Prepend cd to directory names automatically
shopt -s dirspell 2> /dev/null # Correct spelling errors during tab-completion
shopt -s cdspell 2> /dev/null # Correct spelling errors in arguments supplied to cd

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
  "$SCRIPTS" \
  "$GOBIN"

# Source bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
  source /usr/share/bash-completion/bash_completion

# Bash parameter completion for the dotnet CLI
function _dotnet_bash_complete()
{
  local cur="${COMP_WORDS[COMP_CWORD]}" IFS=$'\n'
  local candidates
  read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)
  read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$cur")
}

complete -f -F _dotnet_bash_complete dotnet
