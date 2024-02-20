# The following files are sourced if they're present
# This keeps things a little more organized and modular
# ~/.bash_extras is for other things I don't want to commit
for file in ~/.{bash_exports,bash_prompt,bash_aliases,bash_extras}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# If not running interactively, don't do anything
if [[ $- != *i* ]]; then
  return
fi

set -o vi # Enable vi navigation
shopt -s histappend # Append Bash history
shopt -s autocd # Enable autocd.

