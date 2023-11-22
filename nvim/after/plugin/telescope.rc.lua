local status, telescope = pcall(require, "telescope")
if (not status) then return end

local builtin = require('telescope.builtin')
local keymap = vim.keymap
-- Fuzzy search through the output of git ls-files
-- command, respects .gitignore
keymap.set('n', '<Space>g', builtin.git_files, {})

-- Lists files in your current working directory,
-- respects .gitignore
keymap.set('n', '<Space>f', builtin.find_files, {})

keymap.set('n', '<Space>l', builtin.live_grep, {})

-- keymap.set('n', '<Leader>fb', builtin.buffers, {})

-- Load the file_browser extension for telescope.
telescope.load_extension "file_browser"
-- Open file_browser with the path of the current buffer.
keymap.set('n', '<Space>t', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
