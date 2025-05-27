-- File with general config options.
require('base')
require('plugins')

require('highlights')
require('keymappings')

local has = vim.fn.has
local is_mac = has "macunix"
local is_linux = has "unix"
-- local is_win = has "win32"
-- local is_wsl = has "wsl"

vim.cmd("language en_US")
vim.g.sql_type_default = 'postgresql'

if is_mac == 1 then
  require('macos')
end

if is_linux == 1 then
  require('linux')
end

-- Diagnostics
vim.diagnostic.config({
  virtual_lines = true,
  update_in_insert = true,
})

-- Diagnostic symbols in the sign column (gutter).
local signs = { Error = "✖ ", Warn = " ", Hint = "⌘ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
