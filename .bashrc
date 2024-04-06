# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt
export PS1="\w $ "

# Options
set -o vi

# History
export HISTSIZE=0

# Aliases
unalias -a
alias d="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias todo="vim $HOME/.todo.md"
alias ls="ls --color=auto"
alias c="clear"

