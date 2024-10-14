
-- vim.api.nvim_set_keymap('n', 'gr', "<Cmd>lua vim.fn.VSCodeNotify('editor.action.referenceSearch.trigger')<CR>", { noremap = true })
-- vim.api.nvim_set_keymap('n', 'u', "<Cmd>lua vim.fn.VSCodeNotify('undo')<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-r>', "<Cmd>lua vim.fn.VSCodeNotify('redo')<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true })

-- Efficiently exit insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Insert a new line below and remain in normal mode
vim.api.nvim_set_keymap('n', '<leader>o', 'o<Esc>', { noremap = true, silent = true })

-- Insert a new line above and remain in normal mode
vim.api.nvim_set_keymap('n', '<leader>O', 'O<Esc>', { noremap = true, silent = true })

-- Insert a new line above and remain in normal mode
vim.api.nvim_set_keymap('n', 'O', 'O<Esc>', { noremap = true, silent = true })
