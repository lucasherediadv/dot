#!/bin/bash
#
# Quickly setup my configuration files on another system

# Clone from here...
GIT_REPO_URL="https://github.com/lucasherediadv/dot.git"

# to here
DOTFILES_DIR="$HOME/dot"

# Create dotfiles directory if it dosen't exist
mkdir "$DOTFILES_DIR"

# Set git alias for dotfiles
alias dot='/usr/bin/git --git-dir=$DOTFILES_DIR/ --work-tree=$HOME'

# Source repository ignore the folder where you will clone it
# so that you don't create weird recursion problems
echo "$DOTFILES_DIR" >> "$HOME/.gitignore"

# Clone bare git repository
git clone --bare "$GIT_REPO_URL" "$DOTFILES_DIR"

# Checkout the actual content from the bare repository
# -f will rewrite the already existing files
dot checkout -f

# Configure git to ignore untracked files
dot config status.showUntrackedFiles no

