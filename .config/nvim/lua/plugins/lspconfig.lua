---@diagnostic disable: missing-fields

local config = function()
  local lspconfig = require("lspconfig")

  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "❌",
        [vim.diagnostic.severity.WARN] = "⚠️",
        [vim.diagnostic.severity.HINT] = "💡",
        [vim.diagnostic.severity.INFO] = "ℹ️",
      },
    },
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
  })
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities, require('blink.cmp').get_lsp_capabilities())

  -- lua
  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = { -- custom settings for lua
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.stdpath("config") .. "/lua",
          },
        },
      },
    },
  })

  --rust
  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
  })

  -- json
  lspconfig.jsonls.setup({
    capabilities = capabilities,
  })

  -- python
  lspconfig.pyright.setup({
    capabilities = capabilities,
  })

  -- typescript
  lspconfig.ts_ls.setup({
    capabilities = capabilities,
    filetypes = {
      "templ",
    },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
  })

  -- bash
  lspconfig.bashls.setup({
    capabilities = capabilities,
  })

  -- docker
  lspconfig.dockerls.setup({
    capabilities = capabilities,
  })

  -- C/C++
  lspconfig.clangd.setup({
    capabilities = capabilities,
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  })

  --php
  lspconfig.intelephense.setup({
    capabilities = capabilities,
  })

  --go
  lspconfig.gopls.setup({
    capabilities = capabilities,
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  })
  --zig
  lspconfig.zls.setup({
    capabilities = capabilities,
    filetypes = { "zig" },
  })

  --htmx
  lspconfig.htmx.setup({
    capabilities = capabilities,
  })
  --dart
  lspconfig["dartls"].setup({
    capabilities = capabilities,
    settings = {
      dart = {
        analysisExcludedFolders = {
          vim.fn.expand("$HOME/.local/.cache")
        }
      }
    }
  })
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
  },
}
