local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- Oil
keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

--fzf
local fzf = require('fzf-lua')
keymap.set("n", "<leader>ff", fzf.files, opts)
keymap.set("n", "<leader>rg", fzf.grep, opts)
keymap.set("n", "<leader>fb", fzf.buffers, opts)

--foldimportToggle
keymap.set("n", "<leader>i", ":FoldImportsToggle<CR>", opts) -- Fold imports toggle

--exit insert mode
keymap.set("i", "jj", "<Esc>", opts)

--Lsp
keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)      --formating file
keymap.set("n", "<leader>gD", vim.lsp.buf.definition, opts)  -- go to definition
keymap.set("n", "D", vim.diagnostic.open_float, opts)
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions
keymap.set("n", "K", vim.lsp.buf.hover, opts)                -- show documentation for what is under cursor

--lazygit
keymap.set('n', "<leader>lg",
  "<cmd>LazyGit<cr><cmd>hi LazyGitFloat guibg=NONE guifg=NONE<cr><cmd>setlocal winhl=NormalFloat:LazyGitFloat<cr>", opts)

--common keymaps
keymap.set("n", "<leader>w", ":write<CR>", opts)
keymap.set("n", "<leader>q", ":quit<CR>", opts)
