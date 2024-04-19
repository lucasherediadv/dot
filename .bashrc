# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Prompt.
export PS1="\w $ "

# Use VI commands.
set -o vi

# Disable bash history.
# ln -sv /dev/null "$HISTFILE"
export HISTSIZE=0

# Aliases.
unalias -a
alias d="/usr/bin/git --git-dir=$HOME/Repos/github.com/lucasherediadv/dotfiles --work-tree=$HOME"
alias ls="ls --color=auto"
alias c="clear"

