local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.ts_ls.setup {
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

nvim_lsp.postgres_lsp.setup {
  capabilities = capabilities,
  cmd = { "postgrestools", "lsp-proxy" },
  filetypes = { "sql" },
  single_file_support = true
}

nvim_lsp.tailwindcss.setup {
  capabilities = capabilities
}

nvim_lsp.jsonls.setup({
  capabilities = capabilities,
})

nvim_lsp.dockerls.setup({
  capabilities = capabilities,
})

nvim_lsp.docker_compose_language_service.setup({
  capabilities = capabilities,
})

nvim_lsp.yamlls.setup({
  capabilities = capabilities,
})

-- sqls is still not working great,
-- not all the features of an LSP
-- are working on SQL files.
-- nvim_lsp.sqls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

nvim_lsp.elixirls.setup({
  capabilities = capabilities,
})

nvim_lsp.marksman.setup({
  capabilities = capabilities,
})
