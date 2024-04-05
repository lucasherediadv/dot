# If not running interactively, don't do anything
if [[ $- != *i* ]]; then
  return
fi

# Prompt
export PS1="\w $ "

# Options
set -o vi

# History
export HISTSIZE=0

# Aliases
unalias -a
alias d="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias todo="vim ~/.todo.md"
alias ls="ls --color=auto"
alias c="clear"
alias tls="tmux ls"
alias tks="tmux kill-session"

# Exports
export TERMINAL="usr/bin/foot"
export SVN_EDITOR="vim"
export EDITOR="vim"

