# Dotfiles

My personal configuration files for Arch Linux, managed using GNU Stow.

## Prerequisites

### Required Software

- GNU Stow
- Git

### Recommended Packages

- Neovim
- tmux
- lsd
- Hyprland
- Dunst
- Dolphin

## Installation

### Clone the Repository

```bash
git clone https://github.com/Stan-breaks/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Stow Packages

To symlink configurations, use the following commands:

```bash
# Stow individual configurations
stow nvim
stow tmux
stow lsd
stow hyprland
stow dunst
stow dolphin
```

### Optional: Stow All Configs

```bash
stow *
```

## System Requirements

### Arch Linux Packages

Ensure the following packages are installed:

```bash
# Example installation command
sudo pacman -S neovim tmux lsd hyprland dunst dolphin
```

## Customization

### Personal Modifications

- Fork this repository
- Adjust configurations to suit your workflow
- Add your personal touches to each config

## Workflow Tips

### Neovim

- Custom keybindings in `~/.config/nvim`
- Plugin management via your preferred method

### tmux

- Prefix key customizations
- Additional plugins and status bar configurations

### Hyprland

- Modify keyboard/mouse bindings
- Adjust display and workspace configurations

## Troubleshooting

### Stow Conflicts

If you encounter conflicts:

```bash
# Simulate stow to check for issues
stow --simulate *
```

### Uninstalling Configs

```bash
# To remove symlinks
stow -D package_name
```

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

[Your Chosen License - e.g., MIT]

## Acknowledgments

- GNU Stow
- Arch Linux Community
- Open Source Contributors
