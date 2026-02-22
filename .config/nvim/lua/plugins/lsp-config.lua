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
  vim.lsp.enable("lua_ls")

  --rust
  vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
  })
  vim.lsp.enable("rust_analyzer")

  -- json
  vim.lsp.config("jsonls", {
    capabilities = capabilities,
  })
  vim.lsp.enable("jsonls")

  -- python
  vim.lsp.config("pylsp", {
    capabilities = capabilities,
  })
  vim.lsp.enable("pylsp")

  vim.lsp.config("vtsls", {
    capabilities = capabilities,
  })
  vim.lsp.enable("vtsls")

  -- bash
  vim.lsp.config("bashls", {
    capabilities = capabilities,
  })
  vim.lsp.enable("bashls")

  -- C/C++
  vim.lsp.config("ccls", {
    capabilities = capabilities,
  })
  vim.lsp.enable("ccls")

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
  vim.lsp.enable("gopls")

  --zig
  vim.lsp.config("zls", {
    capabilities = capabilities,
  })
  vim.lsp.enable("zls")

  --java
  vim.lsp.config("jdtls", {
    capabilities = capabilities,
  })
  vim.lsp.enable("jdtls")

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

  --nushell
  vim.lsp.config("nuls", {
    capabilities = capabilities,
  })

  vim.lsp.enable("nuls")
end

return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
  },
}
