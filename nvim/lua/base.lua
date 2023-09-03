-- @erodrigufer
-- General config options --

-- Turn the bell off for all events.
vim.opt.belloff = 'all'

-- Relative numbering of lines related to the cursor
-- position.
-- The two options must be present, so that the current
-- cursor line shows the absolute line number.
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs and spaces.
-- A tab will be exchanged for spaces.
vim.opt.expandtab = true
-- How many columns of whitespace is a \t char worth?
vim.opt.tabstop = 2
-- How many columns of whitespace a “level of indentation” is worth?
vim.opt.shiftwidth = 2
-- How many columns of whitespace is a tab keypress or a backspace keypress worth?
vim.opt.softtabstop = 2
