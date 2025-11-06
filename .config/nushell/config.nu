# config.nu
#
# Installed by:
# version = "0.102.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
$env.config.show_banner = false
$env.STARSHIP_SHELL = "nu"
$env.STARSHIP_CONFIG = "/home/stan/.config/starship.toml"
def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS --status=($env.LAST_EXIT_CODE)
}
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ": "
$env.PROMPT_INDICATOR_VI_NORMAL = "〉"
$env.PROMPT_MULTILINE_INDICATOR = "::: "
$env.config.buffer_editor = "nvim"
$env.config.edit_mode = 'vi'


source ~/.cache/nushell/init.nu
source ~/dotfiles/.config/nushell/vim.nu
source ~/.zoxide.nu
source ~/.local/share/atuin/init.nu
