local config = function()
  -- Gruvbox color palette (dark mode)
  local colors = {
    error = "#cc241d",      -- Gruvbox red
    warn = "#d79921",       -- Gruvbox yellow
    info = "#458588",       -- Gruvbox blue
    hint = "#689d6a",       -- Gruvbox green
    background = "#000000", -- Gruvbox dark background
    foreground = "#ebdbb2", -- Gruvbox light foreground
    border = "#504945",     -- Gruvbox dark border color
  }
  -- Notify setup (integrated with Noice)
  local notify = require("notify")
  notify.setup({
    stages = "slide",
    timeout = 3000,
    fps = 60,
    background_colour = colors.background,
    minimum_width = 50,
    maximum_width = 100,
    render = "compact",
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
    highlights = {
      ErrorMsg = {
        fg = colors.error,
        bg = colors.background,
        bold = true,
      },
      WarningMsg = {
        fg = colors.warn,
        bg = colors.background,
        italic = true,
      },
    },
  })

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
            Normal = "Normal", FloatBorder = "DiagnosticInfo"
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

    -- Message routing with Gruvbox-inspired color handling
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "search_count",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          kind = "wmsg",
        },
        view = "mini",
      },
      {
        filter = {
          event = "msg_show",
          kind = "emsg",
          find = "E325",
        },
        opts = { skip = true },
      },
    },

    -- Advanced routing for different message types
    format = {
      level = {
        error = {
          icon = "❌ ",
          hl_group = "NoiceError",
        },
        warn = {
          icon = "⚠️ ",
          hl_group = "NoiceWarn",
        },
        info = {
          icon = "ℹ️ ",
          hl_group = "NoiceInfo",
        },
      }
    },
  })

  -- Custom highlights to integrate with Gruvbox
  vim.cmd([[
      " Noice Highlights matching Gruvbox
      highlight NoicePopupNormal guibg=#1d2021 guifg=#ebdbb2
      highlight NoiceBorder guifg=#504945
      highlight NoiceError guifg=#cc241d
      highlight NoiceWarn guifg=#d79921
      highlight NoiceInfo guifg=#458588
    ]])

  -- Override vim.notify with our custom notify
  vim.notify = notify
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
