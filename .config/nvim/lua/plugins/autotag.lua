-- autotag
local config = function()
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
return {
  "windwp/nvim-ts-autotag",
  event = "VeryLazy",
  config = config,
}
