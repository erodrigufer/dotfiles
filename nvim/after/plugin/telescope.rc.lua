local status, telescope = pcall(require, "telescope")
if (not status) then return end

local builtin = require('telescope.builtin')
-- Fuzzy search through the output of git ls-files 
-- command, respects .gitignore
vim.keymap.set('n', '<Space>f', builtin.git_files, {})

-- Lists files in your current working directory, 
-- respects .gitignore
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Load the file_browser extension for telescope.
telescope.load_extension "file_browser"
