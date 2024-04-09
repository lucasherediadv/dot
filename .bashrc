# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Prompt.
export PS1="\w $ "

# Options.
set -o vi

# Disable bash history.
export HISTSIZE=0

# Aliases.
unalias -a
alias d="/usr/bin/git --git-dir=$HOME/Projects/dotfiles/ --work-tree=$HOME"
alias todo="vim $HOME/Projects/.todo.md"
alias ls="ls --color=auto"
alias c="clear"

