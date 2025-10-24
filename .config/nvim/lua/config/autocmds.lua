--markdown autoformatting
vim.api.nvim_create_augroup("Markdown", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.textwidth = 101
  end,
  group = "Markdown",
})
