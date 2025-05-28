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
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✖',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.INFO] = '',
      [vim.diagnostic.severity.HINT] = '⌘',
    },
  },
})
