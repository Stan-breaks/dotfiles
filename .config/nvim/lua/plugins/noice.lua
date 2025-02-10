local config = function()
  local colors = {
    error = "#cc241d",      -- Gruvbox red
    warn = "#d79921",       -- Gruvbox yellow
    info = "#458588",       -- Gruvbox blue
    hint = "#689d6a",       -- Gruvbox green
    background = "#000000", -- Gruvbox dark background
    foreground = "#ebdbb2", -- Gruvbox light foreground
    border = "#504945",     -- Gruvbox dark border color
  }
  -- Noice setup
  require("noice").setup({
    -- Styling to match Gruvbox theme
    views = {
      cmdline_popup = {
        position = {
          row = "50%",
          col = "50%",
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
          color = colors.border,

        },
        win_options = {
          winhighlight = {
            Normal = "NoicePopupNormal",
            FloatBorder = "NoiceBorder",
          },
        },
      },
      popupmenu = {
        relative = "editor",
        border = {
          style = "rounded",
          padding = { 0, 1 },
          color = colors.border,
        },
        win_options = {
          winhighlight = {
            Normal = "NoicePopupNormal",
            FloatBorder = "NoiceBorder",
          },
        },
      },
    },
    history = {
      -- Number of notifications to keep in history
      view = "popup",
      opts = {
        enter = true,
      },
      filter = {
        any = {
          { event = "msg_show" },
          { error = true },
          { warning = true },
          { event = "cmdline" },
        }
      },
    },
    -- LSP and message rendering
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = {
        enabled = true,
        view = "hover",
        silent = true, -- Suppress notifications when docs are retrieved
        opts = {
          border = {
            style = "rounded",
            padding = { 1, 2 },
            color = colors.border,
          },
        },
      },
      signature = {
        enabled = true,
        auto_open = {
          enabled = true,
          trigger = true,
          luasnip = true,
          throttle = 50,
        },
      },
    },

    -- Presets configuration
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },
  })
end
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = config,
}
