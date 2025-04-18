local keymap = vim.keymap

-- Change leader (if desired).
-- vim.g.mapleader = ','

-- Do not yank when deleting with 'x'.
-- keymap.set('n', 'x', '"_x')

-- S[ubstitute]: delete the word over the cursor and paste the last yanked text.
-- keymap.set('n', 'S', 'diw"0P')

-- Move window.
-- Switch to next window.
-- keymap.set('n', '<Tab>', '<C-w>w')
-- keymap.set('', 'sh', '<C-w>h')
-- keymap.set('', 'sk', '<C-w>k')
-- keymap.set('', 'sj', '<C-w>j')
-- keymap.set('', 'sl', '<C-w>l')
--
-- Buffers.
-- TODO: maybe there is a more elegant way in nvim
-- Switch to next or previous buffer.
keymap.set('n', '<Leader>[', ':bp<CR>', { silent = true })
keymap.set('n', '<Leader>]', ':bn<CR>', { silent = true })

-- Close all buffers.
-- <S> : Shift
-- keymap.set('n', '<S-z>', ':qa!')
-- Write all buffers and close them.
-- keymap.set('n', '<S-e>', ':wqa<CR>')
-- Store current buffer.
keymap.set('n', '<Space><Space>', ':w<CR>')

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
keymap.set('n', 'n', 'nzzzv', { noremap = true })
keymap.set('n', 'N', 'Nzzzv', { noremap = true })

-- Terminal
-- Switch to normal mode with ESC in terminal mode.
-- keymap.set('t', '<ESC>', '<C-\\><C-n>', { noremap = true })

-- Floating command line.
keymap.set('n', ':', '<cmd>FineCmdline<CR>', { noremap = true })
