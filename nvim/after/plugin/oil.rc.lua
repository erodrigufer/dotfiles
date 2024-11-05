local status, oil = pcall(require, "oil")
if (not status) then return end

oil.setup({
  skip_confirm_for_simple_edits = true,
  view_options = {
    show_hidden = false,
  },
})
