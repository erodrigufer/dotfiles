-- Auto-format templ code before buffer write.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.templ" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

return {
  cmd = { "templ", "lsp"},
}
