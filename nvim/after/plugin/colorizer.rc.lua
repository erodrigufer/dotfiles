local status, colorizer = pcall(require, 'colorizer')
if (not status) then return end

colorizer.setup({
  css = { css = true, }, -- Enable parsing rgb(...) functions in css.
  'html',
  'javascript',
})
