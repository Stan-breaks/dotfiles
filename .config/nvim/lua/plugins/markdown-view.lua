function config()
  local presets = require("markview.presets");

  require("markview").setup({
    checkboxes = presets.checkboxes.nerd,
    headings = presets.headings.glow
  });
end

return {
  "OXY2DEV/markview.nvim",
  lazy = true,
  ft = "markdown", -- If you decide to lazy-load anyway

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  }
}
