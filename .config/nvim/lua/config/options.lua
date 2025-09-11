local opt = vim.opt

opt.wrap = false

-- Search -------------------------------------
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearance -------------------------------------
opt.relativenumber = true
opt.number = true
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.winborder = "rounded"


-- Behavior --------------------------------------
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.clipboard = "unnamedplus"
opt.modifiable = true
opt.encoding = "UTF-8"

-- File-specific Settings ------------------------
opt.conceallevel = 1

-- Window Behavior ------------------------------
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 5 -- Popup menu transparency

-- File Management -----------------------------
opt.autowrite = true
opt.autoread = true

-- Add visual feedback for errors instead of bells
opt.visualbell = true


-- Spellings
opt.spell = true
opt.spelllang = "en_us"
