local status, ibl = pcall(require, "ibl")
if (not status) then return end

ibl.setup({
  scope = {
    show_start = false,
    show_end = false,
  },
})
