# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Use VI commands
set -o vi

# Prompt
PS1='\w $ '

# Environment variables
unset HISTFILE
export EDITOR=vim
export VISUAL=vim
export REPOS="$HOME/Repos"
export GITUSER="lucasherediadv"
export GHREPOS="$REPOS/github.com/$GITUSER"
export LESSHISTFILE=/dev/null

# Path
export PATH=$PATH:$GHREPOS/scr/bin

# Aliases
unalias -a
alias dot='/usr/bin/git --git-dir=/home/user/.dot --work-tree=$HOME'
alias ls='ls -h --color=auto'
alias ghrepos='cd $GHREPOS'
alias gr='ghrepos'
alias todo='vim ~/.todo.md'
alias c='clear'
