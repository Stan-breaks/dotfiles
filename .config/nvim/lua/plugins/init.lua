vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/kdheepak/lazygit.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/saghen/blink.cmp",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/OXY2DEV/markview.nvim",
  "https://github.com/binarylinuxx/graphite-nvim",
  "https://github.com/epwalsh/obsidian.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
})



vim.o.background = "dark"
vim.cmd.colorscheme("graphite")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "statusline", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })

require('vim._core.ui2').enable({ enable = true })

require("nvim-ts-autotag").setup({
  filetypes = {
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
  }
})


local presets = require("markview.presets");
require("markview").setup({
  markdown = {
    headings = presets.headings.glow,
    checkboxes = presets.checkboxes.nerd
  }
})


require("plugins.lsp-config")

require("obsidian").setup({
  ui = {
    enable = false,
  },
  workspaces = {
    {
      name = "personal",
      path = "~/vaults/personal",
    },
    {
      name = "work",
      path = "~/vaults/school/",
    },
  },
})

require("fzf-lua").setup({
  winopts = {
    height = 0.3,        -- 30% of screen
    width = 0.5,         -- 50% of screen
    preview = {
      hidden = 'hidden', -- completely disable preview window
    },
  },
  keymap = {
    fzf = {
      ["tab"] = "down",
      ["shift-tab"] = "up",
    }
  },
})

require("oil").setup({
  default_file_explorer = true,
  delete_to_trash = true,
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = true,
    natural_order = true,
    is_always_hidden = function(name, _)
      return name == ".." or name == ".git"
    end,
  },
  float = {
    padding = 2,
    max_width = 90,
    max_height = 0,
  },
  win_options = {
    wrap = true,
    winblend = 0,
  },
  keymaps = {
    ["<C-c>"] = false,
    ["q"] = "actions.close",
    ["<Esc>"] = "actions.close",
  },
})

require("blink.cmp").setup({
  keymap = {
    preset = 'default',
    ['<CR>'] = { 'accept', 'fallback' },
  },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = { documentation = { auto_show = true } },
  signature = { enabled = true },
})
