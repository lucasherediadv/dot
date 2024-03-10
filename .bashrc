# ~/.bashrc

# if not running interactively, don't do anything
if [[ $- != *i* ]]; then
  return
fi

# minimal prompt
export PS1="\w $ "

# enable vi commands
set -o vi

# history
HISTCONTROL=ignoreboth,ignorespace
HISTFILESIZE=10000

# aliases
unalias -a
alias d='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias c='clear'
alias todo='vim ~/Projects/zettelkasten/todo.md'

