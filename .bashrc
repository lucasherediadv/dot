# If not running interactively, don't do anything
if [[ $- != *i* ]]; then
  return
fi

# Prompt
export PS1="\w $ "

# Options
# Enable vi commands
set -o vi
# Checks the window size after each command
shopt -s checkwinsize

# Disable history
export HISTSIZE=0

# Aliases
unalias -a
alias d="/usr/bin/git --git-dir=$HOME/Projects/dotfiles/ --work-tree=$HOME"
alias todo="vim ~/Projects/notes/todo.md"
alias ls="ls --color=auto"
alias c="clear"
alias tls="tmux ls"
alias tks="tmux kill-session"

# Exports
export TERMINAL="usr/bin/foot"
export SVN_EDITOR="vim"
export EDITOR="vim"

# Functions
# cd and ls in one
cl() {
  local dir="$1"
  local dir="${dir:=$HOME}"
  if [[ -d "$dir" ]]; then
    cd "$dir" >/dev/null; ls -all --color=auto
  else
    echo "bash: cl: $dir: Directory not found"
  fi
}

