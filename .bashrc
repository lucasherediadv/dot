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
HISTCONTROL=ignoreboth
HISTFILESIZE=10000

# aliases
alias d='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias l='ls -l  --color=auto'
alias ll='ls -la --color=auto'
alias todo="vim ~/.todo.md"

