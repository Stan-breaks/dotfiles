local config = function()
  require("mason").setup({
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })

  require("mason-lspconfig").setup({
    -- Automatically install LSP servers
    automatic_installation = true,
    ensure_installed = {
      -- LSP Servers
      "lua_ls",
      "rust_analyzer",
      "jsonls",
      "pyright",
      "ts_ls",
      "bashls",
      "dockerls",
      "clangd",
      "intelephense",
      "gopls",
      "jdtls",
      "zls",
    },
  })
end

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = config,
}
