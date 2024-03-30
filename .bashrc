# If not running interactively, don't do anything
if [[ $- != *i* ]]; then
  return
fi

# Prompt
export PS1="\w $ "

# Options
set -o vi # Enable vi commands
shopt -s checkwinsize # Checks the window size after each command and,
                      # if necessary, updates the values of LINES and COLUMNS

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
export PATH=$PATH:~/Projects/scripts/create_new_note/

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

