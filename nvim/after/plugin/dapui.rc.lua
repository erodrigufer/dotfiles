local status, dap = pcall(require, "dap")
if (not status) then return end

local statusUi, dapui = pcall(require, "dapui")
if (not statusUi) then return end

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

function _dap_toggle_breakpoint()
  dap.toggle_breakpoint()
end

function _dap_continue()
  dap.continue()
end

function _dap_step_over()
  dap.step_over()
end

function _dap_step_into()
  dap.step_into()
end

function _dap_step_out()
  dap.step_out()
end

function _dap_repl_open()
  dap.repl.open()
end
