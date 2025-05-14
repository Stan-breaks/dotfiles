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

-- widow Management
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)          -- Split vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts)           -- Split Horizontally
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle Minimize

--comments
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

--noice
keymap.set("n", "<leader>uh", ":NoiceHistory<CR>")
keymap.set("n", "<leader>un", ":NoiceDismiss<CR>")

--gitBlame
keymap.set("n", "<leader>bl", ":BlameToggle<CR>")

--fzf
keymap.set("n", "<leader>ff", ":lua require('fzf-lua').files()<CR>")
keymap.set("n", "<leader>fq", ":lua require('fzf-lua').quickfix()<CR>")
keymap.set("n", "<leader>fb", ":lua require('fzf-lua').buffers()<CR>")
