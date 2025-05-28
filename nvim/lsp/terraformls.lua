-- Auto-format Terraform code before buffer write.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

return {
  cmd = { "terraform-ls", "serve"},
  filetypes = {"tf"},
}
