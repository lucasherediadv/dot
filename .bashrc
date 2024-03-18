# If not running interactively, don't do anything
if [[ $- != *i* ]]; then
  return
fi

# Prompt
export PS1="\w $ "

# Vi commands
set -o vi

# History
shopt -s histappend;
HISTCONTROL=ignoreboth,ignorespace
HISTFILESIZE=10000

# Aliases
unalias -a
alias tre="tree -aC -I '.git|node_modules|bower_components|dotfiles' --dirsfirst "$@" | less -FRNX;"
alias d="/usr/bin/git --git-dir=$HOME/Projects/dotfiles/ --work-tree=$HOME"
alias todo="vim ~/Projects/notes/todo.md"
alias ls="ls --color=auto"
alias c="clear"

# Exports
export PATH=$PATH:~/Projects/scripts/create_new_note/

