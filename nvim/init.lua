-- File with general config options.
require('base')
require('plugins')

require('highlights')
require('keymappings')

local has = vim.fn.has
local is_mac = has "macunix"
local is_linux = has "unix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac == 1 then
  require('macos')
end
