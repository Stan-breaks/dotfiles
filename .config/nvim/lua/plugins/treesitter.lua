---@diagnostic disable: missing-fields
local config = function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "rust",
      "markdown",
      "json",
      "javascript",
      "typescript",
      "yaml",
      "html",
      "css",
      "bash",
      "lua",
      "dockerfile",
      "gitignore",
      "python",
      "php",
      "vue",
      "svelte",
      "toml",
      "markdown_inline",
      "regex",
      "jsonc",
      "vimdoc",
      "vim",
      "go",
      "zig",
    },
    auto_install = true,
    highlight = {
      enable = true,
      -- Remove additional_vim_regex_highlighting or set to false
      -- This can cause conflicts and the error you're seeing
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-s>",
        node_incremental = "<C-s>",
        scope_incremental = false,
        node_decremental = "<BS>",
      },
    },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Moved here
  event = {            -- Moved here
    "BufReadPre",
    "BufNewFile",
  },
  lazy = false,
  config = config,
}
