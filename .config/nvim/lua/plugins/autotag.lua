return {
  "windwp/nvim-ts-autotag",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("nvim-ts-autotag").setup({
      opts = {
        filetypes = {
          "html",
          "xml",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "svelte",
          "vue",
          "htmx",
          "templ",
        },
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    })
  end,
}
