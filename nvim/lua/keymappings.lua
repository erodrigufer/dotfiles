local keymap = vim.keymap

-- Do not yank when deleting with 'x'.
keymap.set('n', 'x', '"_x')

-- S[ubstitute]: delete the word over the cursor and paste the last yanked text.
keymap.set('n', 'S', 'diw"0P')


-- Select all.
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Split window (horizontal/vertical), 
-- and switch to new window (<C-w>w).
keymap.set('n', 'ss', ':vsplit<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':split<Return><C-w>w', { silent = true })

-- Move window.
-- Switch to next window.
keymap.set('n', '<Tab>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Buffers.
-- TODO: maybe there is a more elegant way in nvim
-- Switch to next or previous buffer.
keymap.set('n', '<leader>[', ':bp<CR>')
keymap.set('n', '<leader>]', ':bn<CR>')
