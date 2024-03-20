# Dotfiles

These are my configuration files for bash, vim, tmux, and other tools.

## Objective

Maintain a minimum set of configurations while keeping it well documented and organized to facilitate maintainance and portability.

## Git bare respository

I utilize a "bare repository and alias method" to manage my dotfiles across the system. The method consist in storing a git bare repository in a side folder (like $HOME/.dotfiles) using a specially crafted alias so that command are run against that repository and not the usual `.git` local folder.

For more information see [here](https://wiki.archlinux.org/title/Dotfiles).

## Setup on another machine

Currently working on [this](https://github.com/lucasherediadv/scripts/tree/main/setup_dotfiles).

