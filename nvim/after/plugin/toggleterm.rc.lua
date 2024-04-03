local status, toggleterm = pcall(require, "toggleterm")
if (not status) then return end

toggleterm.setup {}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, close_on_exit = true, direction = "float" })

function _lazygit_toggle()
  lazygit:toggle()
end

local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, close_on_exit = true, direction = "float" })

function _lazydocker_toggle()
  lazydocker:toggle()
end

local termWithoutCmd = Terminal:new({ hidden = true, close_on_exit = false, direction = "float" })

function _termWithoutCmd_toggle()
  termWithoutCmd:toggle()
end
