# Load the shell dotfiles, and then some:
# ~/.path can be used to extend `$PATH`.
# ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,exports,bash_prompt,functions,aliases,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Enable bash completion
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi

# Exit early if not interactive
[ -z "$PS1" ] && return

# Enable vi commands
set -o vi

# Append instead of overwriting Bash history
shopt -s histappend

# Enable autocd. When enabled, just the name of a directory will be sufficient to cd to it.
shopt -s autocd

