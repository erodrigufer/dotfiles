print('highlights loaded!')

-- Highlight the cursor line.
vim.opt.cursorline = true

-- Enables 24-bit RGB color in the TUI. 
vim.opt.termguicolors = true
-- This option does NOT change the background color, 
-- it tells Nvim what the "inherited" (terminal/GUI) 
-- background looks like.
vim.opt.background = 'dark'
