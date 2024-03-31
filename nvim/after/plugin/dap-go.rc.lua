local status, dapGo = pcall(require, "dap-go")
if (not status) then return end

dapGo.setup()
