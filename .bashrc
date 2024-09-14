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
export LESSHISTFILE=/dev/null

# Aliases
unalias -a
alias dot='/usr/bin/git --git-dir=/home/user/.dot --work-tree=$HOME'
alias ls='ls -h --color=auto'
alias to='vim ~/.todo.md'
alias c='clear'
