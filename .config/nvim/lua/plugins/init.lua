return {
  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {}
  },
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  --lazygit
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr><cmd>hi LazyGitFloat guibg=NONE guifg=NONE<cr><cmd>setlocal winhl=NormalFloat:LazyGitFloat<cr>', desc = 'LazyGit' },
    },
    config = function()
    end,
    event = "VeryLazy",
  },
  --fzf
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = true,
    opts = {
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
    },
  },
  --oil
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy", -- Load after startup
    cmd = "Oil",        -- Load when Oil command is used
    opts = {
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
    }
  },
  -- harpoon
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
    },
    event = "VeryLazy"
  },
  -- graphite theme
  {
    "binarylinuxx/graphite-nvim",
    priority = 1000, -- Load first
  },
  --fold-imports
  {
    "dmtrKovalenko/fold-imports.nvim",
    opts = {},
    event = "BufRead"
  },
  --autotag
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup({
        filetypes = {
          "html",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "htmx",
          "templ",
        },
      })
    end
  }
}
