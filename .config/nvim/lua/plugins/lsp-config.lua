---@diagnostic disable: missing-fields

local config = function()
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
  vim.lsp.config("lua_ls", {
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
  vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
  })

  -- json
  vim.lsp.config("jsonls", {
    capabilities = capabilities,
  })

  -- python
  vim.lsp.config("pyright", {
    capabilities = capabilities,
  })

  -- typescript
  vim.lsp.config("ts_ls", {
    capabilities = capabilities,
    filetypes = {
      "templ",
    },
  })

  -- bash
  vim.lsp.config("bashls", {
    capabilities = capabilities,
  })

  -- docker
  vim.lsp.config("dockerls", {
    capabilities = capabilities,
  })

  -- C/C++
  vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = {
      "clangd",
      "--offset-encoding=utf-16",
    },
  })

  --php
  vim.lsp.config("intelephense", {
    capabilities = capabilities,
  })

  --go
  vim.lsp.config("gopls", {
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
  vim.lsp.config("zls", {
    capabilities = capabilities,
    filetypes = { "zig" },
  })

  --htmx
  vim.lsp.config("htmx", {
    capabilities = capabilities,
  })

  --dart
  vim.lsp.config("dartls", {
    capabilities = capabilities,
    settings = {
      dart = {
        analysisExcludedFolders = {
          vim.fn.expand("$HOME/.local/.cache")
        }
      }
    }
  })
  vim.lsp.enable('dartls')

  vim.lsp.config("nuls", {
    cmd = { 'nu', '--lsp' },
    capabilities = capabilities,
    filetypes = { "nu" }
  })

  vim.lsp.enable("nuls")
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
