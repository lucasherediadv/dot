# Dotfiles

My configuration files for bash, vim, tmux, and other things.

## Motivation

Mantain a minimum set of configurations while keeping it well documented and organized to make maintainance and portability easier.

## Git bare respository

I decided to use a "bare repository and alias method" as my strategy for manage my dotfiles across the system.

For more information about this method see [here](https://wiki.archlinux.org/title/Dotfiles)

## Install onto a new system

To setup on another machine run my `setup` script with the following:
```
$ curl -Lks https://github.com/lucsherediadv/scripts/blob/main/setup_dotfiles/setup | /bin/bash
```

