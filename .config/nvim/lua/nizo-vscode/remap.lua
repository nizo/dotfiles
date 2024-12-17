
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })


-- Exit insert mode
keymap({'i'}, 'jj', '<Esc>', opt)

-- Insert a new line below and remain in normal mode
keymap({'n'}, '<leader>o', 'o<Esc>', opt)

-- Insert a new line above and remain in normal mode
keymap({'n'}, '<leader>O', 'O<Esc>', opt)

-- Removes highlighting after escaping vim search
keymap({'n'}, '<Esc>', '<Esc>:noh<CR>', opt)

-- Move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- when deleting use black hole register
keymap({"n", "v"}, "d", '"_d', opts)
keymap("n", "dd", '"_dd', opts)

-- Toggle breakpoints
keymap({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")

-- Hover
keymap({"n", "v"}, "<leader>d", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")

-- View problems
keymap({"n", "v"}, "<leader>sp", "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")

-- Clear all
keymap({"n", "v"}, "<leader>cn", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")

-- Toggle fold 
keymap({"n", "v"}, "<leader><leader>", "<cmd>lua require('vscode').action('editor.toggleFold')<CR>")

-- Code runner
keymap({"n", "v"}, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")

-- Navigate to previuos error in current 
keymap({"n", "v"}, "<leader>e", "<cmd>lua require('vscode').action('editor.action.marker.prev')<CR>")

-- Navigate to next error in current 
keymap({"n", "v"}, "<leader>p", "<cmd>lua require('vscode').action('editor.action.marker.next')<CR>")

-- keymap('n', "'", "'zz")
-- keymap('n', "`", "`zz")

-- Fix cursor movement so the folds are not automatically unfolded
-- keymap({"n", "v"}, "j", "<cmd>lua require('vscode').action('cursorDown')<CR>")
-- keymap({"n", "v"}, "k", "<cmd>lua require('vscode').action('cursorUp')<CR>")


-- Format document
-- keymap({"n", "v"}, "<leader>fd", "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")

-- Navigate to previuos error in files
-- keymap({"n", "v"}, "<leader>fe", "<cmd>lua require('vscode').action('editor.action.marker.prevInFiles')<CR>")

-- Navigate to next error in files
-- keymap({"n", "v"}, "<leader>fp", "<cmd>lua require('vscode').action('editor.action.marker.nextInFiles')<CR>")

-- Quick open
-- keymap({"n", "v"}, "<leader>ff", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")

-- Show commands
-- keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")

-- Fold
-- keymap({"n", "v"}, "<leader>f", "<cmd>lua require('vscode').action('editor.fold')<CR>")

-- Unfold 
-- keymap({"n", "v"}, "<leader>u", "<cmd>lua require('vscode').action('editor.unfold')<CR>")
