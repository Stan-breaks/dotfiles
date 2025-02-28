local config = function()
  -- Optional, you don't have to run setup.
  require("transparent").setup({
    enable = true,
    extra_groups = { -- table/string: additional groups that should be cleared
      "BufferLineTabClose",
      "BufferlineBufferSelected",
      "BufferLineFill",
      "BufferLineBackground",
      "BufferLineSeparator",
      "BufferLineIndicatorSelected",
      "IndentBlanklineChar",
      "Oil",
      "LspFloatWinNormal",
      "Normal",
      "NormalFloat",
      "FloatBorder",
      -- Add noice-specific groups:
      "NoicePopupNormal",
    }
  })
end
return {
  "xiyaowong/transparent.nvim",
  priority = 1000,
  lazy = false,
  config = config
}
