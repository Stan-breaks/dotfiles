require("noice").setup({
views = {
    cmdline_popup = {
      backend = "popup",
      relative = "editor",
      enter = true,
      border = {
        style = "rounded",
      },
      size = {
        width = 80,
        height = 20,
      },
      position = {
        row = "50%",
        col = "50%",
      },
    },
  },
  commands = {
    history = {
      view = "cmdline_popup", -- use the floating view
    },
  },
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    long_message_to_split = true, -- long messages will be sent to a split
  },
})
require("notify").setup({
  background_colour = "#000000",
})
