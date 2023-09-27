-- nvim_buf_set_keymap({buffer}, {mode}, {lhs}, {rhs}, {*opts}) Sets a buffer-local mapping for the given mode.
-- Parameters:
-- {buffer} Buffer handle, or 0 for current buffer.
vim.api.nvim_buf_set_keymap(0, 'n', ',t', ':TSC<CR>', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', ',m', ':TypescriptAddMissingImports<CR>', { noremap = true, silent = true })
vim.api.nvim_buf_set_keymap(0, 'n', ',,', ':TypescriptRemoveUnused<CR>', { noremap = true, silent = true })
