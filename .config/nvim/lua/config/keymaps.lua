local keymap = vim.keymap

local opts = { noremap = true, silent = true }

--Directory Navigation
-- Oil
keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

--pane and window Navigations
keymap.set("n", "<C-h>", "C-w>h", opts)               -- Navigate Left
keymap.set("n", "<C-j>", "C-w>j", opts)               -- Navigate Down
keymap.set("n", "<C-k>", "C-w>k", opts)               -- Navigate Up
keymap.set("n", "<C-l>", "C-w>l", opts)               -- Navigate Right
keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts) -- Navigate Left
keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts) -- Navigate Down
keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts) -- Navigate Up
keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts) -- Navigate Right

--noice
keymap.set("n", "<leader>uh", ":NoiceHistory<CR>", opts) -- Notification History
keymap.set("n", "<leader>un", ":NoiceDismiss<CR>", opts) -- Notification Dismiss

--fzf
keymap.set("n", "<leader>ff", ":lua require('fzf-lua').files()<CR>", opts)     -- Find files
keymap.set("n", "<leader>rg", ":lua require('fzf-lua').grep()<CR>", opts)      -- grep
keymap.set("n", "<leader>fg", ":lua require('fzf-lua').grep_curbuf()<CR>", opts) -- grep in current buffer
keymap.set("n", "<leader>fb", ":lua require('fzf-lua').buffers()<CR>", opts)   -- Find buffers

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

--harpoon
keymap.set("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", opts)
keymap.set("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)
keymap.set("n", "<M-a>", ":lua require('harpoon.ui').nav_next()<CR>", opts) -- navigates to next mark

--common keymaps
keymap.set("n", "<leader>w", ":write<CR>", opts)
keymap.set("n", "<leader>q", ":quit<CR>", opts)
