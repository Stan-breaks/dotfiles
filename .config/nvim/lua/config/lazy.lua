-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.options")
require("config.autocmds")

require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = false },
})
vim.o.background = "dark"
vim.cmd.colorscheme("graphite")
vim.api.nvim_set_hl(0,"Normal",{bg = "none"})
vim.api.nvim_set_hl(0,"statusline",{bg = "none"})
vim.api.nvim_set_hl(0,"NormalNC",{bg = "none"})
vim.api.nvim_set_hl(0,"EndOfBuffer",{bg = "none"})
vim.api.nvim_set_hl(0,"NormalFloat",{bg = "none"})
vim.api.nvim_set_hl(0,"NoicePopupNormal",{bg = "none"})

require("config.keymaps")
require("config.noice")
