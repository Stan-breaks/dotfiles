## Tmux Configuration

This README describes the custom tmux configuration file. It includes various settings to enhance the tmux experience, including key bindings, appearance, and plugin management.
Features

- 256-color and RGB support
- Vi mode for copy and paste
- Increased terminal scrollback
- Custom prefix key (Ctrl+A)
- Mouse support
- Easy window and pane navigation
- Dracula theme
- Session persistence with tmux-resurrect and tmux-continuum

Key Bindings

- Prefix: `Ctrl+A`
- Reload config: `Prefix + R`
- List key bindings: `Prefix + ?`
- New window: `Prefix + C`
- Split window horizontally: `Prefix + =`
- Split window vertically:`Prefix + ]`
- Navigate panes: `Prefix + H/J/K/L`
- Next window: `Prefix + N`
- Previous window: `Prefix + P`
- Copy mode: `Prefix + [, then V to select and Y to copy`

Plugins
This configuration uses the following plugins:

- Tmux Plugin Manager (tpm)
- Dracula theme
- tmux-resurrect
- tmux-continuum

The Dracula theme is configured to show battery and time information.
Installation

Ensure tmux is installed on your system.
Copy this configuration to ~/.config/tmux/tmux.conf.
Install Tmux Plugin Manager (tpm) by following the instructions at: https://github.com/tmux-plugins/tpm
Launch tmux and press `Prefix + I` to install the plugins.

Customization
Feel free to modify the configuration file to suit your needs. You can add or remove plugins, change key bindings, or adjust other settings as desired.
