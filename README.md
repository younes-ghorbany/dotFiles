# My dotfiles

This directory contains my customized dotfiles

## Requirements

Ensure you have the following installed on your system

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git@github.com:younes-ghorbany/dotFiles.git
$ cd dotFiles

```

Then use GNU stow to create symlinks

```
$ stow .
```
