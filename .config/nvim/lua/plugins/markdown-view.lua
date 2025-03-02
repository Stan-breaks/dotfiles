local config = function()
  local presets = require("markview.presets");

  require("markview").setup({
    markdown = {
      headings = presets.headings.glow,
      checkboxes = presets.checkboxes.nerd
    }
  });
end

return {
  "OXY2DEV/markview.nvim",
  lazy = true,
  ft = "markdown", -- If you decide to lazy-load anyway

  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  config = config
}
