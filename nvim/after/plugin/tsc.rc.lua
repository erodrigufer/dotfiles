local status, tsc = pcall(require, "tsc")
if (not status) then return end

tsc.setup {}
