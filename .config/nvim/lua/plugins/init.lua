return {
  --vim tmux

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
    event = "VeryLazy"
  },
  --which key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  -- trouble
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    event = "VeryLazy",
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
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
    opts = {}
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
  --lspsaga
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("lspsaga").setup({})
    end,
    event = "LspAttach",
  },
  --lazydev
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  --neoconf
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf"
  },
  --comment
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
  },
  -- git blame
  {
    "FabijanZulj/blame.nvim",
    event = "VeryLazy",
  },
  -- harpoon
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>a", function() require("harpoon.mark").add_file() end,        desc = "Harpoon: Mark File" },
      { "<C-e>",     function() require("harpoon.ui").toggle_quick_menu() end, desc = "Toggle Harpoon Menu" },
    },
    opts = {
    },
    event = "VeryLazy"
  },
  --indent
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    opts = {},
  },
  --highlight yank
  { "machakann/vim-highlightedyank", lazy = false },
  --gruvbox theme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = ...
  }, {
  'augmentcode/augment.vim',
  event = "VeryLazy",
  cmd = "Augment",
    opts = {
g:augment_disable_completions = v:true,
    }
}, {
  "LunarVim/bigfile.nvim",
  event = "BufReadPre",
  opts = {}
}
}
