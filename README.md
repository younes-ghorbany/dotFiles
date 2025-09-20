# Dotfiles

A collection of my personal configuration files to set up and maintain a consistent development environment.

## Requirements

Make sure the following packages are installed on your system:

### Git

```bash
pacman -S git
```

### Tmux

```bash
pacman -S tmux
```

### Tmux Plugin Manager (TPM)

To manage tmux plugins, install TPM:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

After installation, start tmux and press:

```command
prefix + I
```

to install all plugins defined in .tmux.conf.

### Ghostty (Terminal Emulator)

```bash
pacman -S ghostty
```

### Neovide (Neovim GUI)

```bash
pacman -S neovide
```

### Ranger (Terminal File Manager)

```bash
pacman -S ranger
```

### GNU Stow

```bash
pacman -S stow
```

---

## Installation

Clone the repository into your home directory :

```bash
git clone git@github.com:younes-ghorbany/dotFiles.git ~/dotFiles
cd ~/dotFiles
```

Use GNU Stow to create symlinks for the configurations:

```bash
stow .
```

---

## Notes

Tmux plugins are managed via TPM.

Neovide provides a smooth GUI experience for Neovim.

Ghostty is a modern terminal emulator.

Ranger offers a terminal-based file manager with VI keybindings.

That’s it! Your dotfiles are now linked and ready to use 🚀
