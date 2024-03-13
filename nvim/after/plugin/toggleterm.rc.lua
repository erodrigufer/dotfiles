local status, toggleterm = pcall(require, "toggleterm")
if (not status) then return end

toggleterm.setup {}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit  = Terminal:new({ cmd = "lazygit", hidden = true, close_on_exit = true, direction = "float" })

function _lazygit_toggle()
  lazygit:toggle()
end
