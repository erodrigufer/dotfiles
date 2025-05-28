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

-- Imports get organized on save using the logic of `goimports` and the code formatted.
-- Source: https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.go" },
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})

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

nvim_lsp.terraformls.setup({
  capabilities = capabilities
})
-- Auto-format Terraform code before buffer write.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

nvim_lsp.htmx.setup({
  capabilities = capabilities,
  filetypes = { "html", "templ" },
})

nvim_lsp.html.setup({
  capabilities = capabilities,
  filetypes = { "html", "templ" },
})

nvim_lsp.templ.setup({
  capabilities = capabilities,
})

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

-- Auto-format templ code before buffer write.
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.templ" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Bash LSP.
nvim_lsp.bashls.setup({
  capabilities = capabilities
})
