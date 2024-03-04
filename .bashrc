# ~/.bashrc

# If not running interactively, don't do anything
if [[ $- != *i* ]]; then
  return
fi

# Minimal prompt
export PS1="\w $ "

# Enable vi commands
set -o vi

# Aliases
alias d='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls="ls --color=auto"
alias v="vim"
alias todo="vi ~/.todo.md"

