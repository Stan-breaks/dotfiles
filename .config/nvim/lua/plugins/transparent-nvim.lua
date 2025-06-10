local config = function()
  -- Optional, you don't have to run setup.
  require("transparent").setup({
    enable = true,
    extra_groups = {
      "NormalFloat",
      "NoicePopupNormal",
    },
  })
end
return {
  "xiyaowong/transparent.nvim",
  priority = 1000,
  lazy = false,
  config = config
}
