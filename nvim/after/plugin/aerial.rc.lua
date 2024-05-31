local status, aerial = pcall(require, "aerial")
if (not status) then return end

aerial.setup({
  layout = {
    -- max_width = {60, 0.3} means "the lesser of 60 columns or 30% of total"
    max_width = { 60, 0.3 },
    min_width = 30,
    default_direction = "prefer_left",
  },
})
