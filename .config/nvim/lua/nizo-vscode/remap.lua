
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

-- Delete current line and past the content of clipboard
keymap({'n'}, 'P', 'pkddyy', opt)

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

-- Code runner
keymap({"n", "v"}, "<leader>pr", "<cmd>lua require('vscode').action('code-runner.run')<CR>")

-- Navigate to previuos error in current 
keymap({"n", "v"}, "<leader>e", "<cmd>lua require('vscode').action('editor.action.marker.prev')<CR>")

-- Navigate to next error in current 
keymap({"n", "v"}, "<leader>p", "<cmd>lua require('vscode').action('editor.action.marker.next')<CR>")

-- Remap 'n' to search and center the line
keymap("n", "n", function()
  vim.cmd(":norm! n")
  local curline = vim.fn.line(".")
  local vscode = require('vscode')
  vscode.call("revealLine", { args = {lineNumber = curline, at = "center"} })
end, { noremap = true, silent = true })

-- Remap 'N' to search backwards and center the line
keymap("n", "N", function()
  vim.cmd(":norm! N")
  local curline = vim.fn.line(".")
  local vscode = require('vscode')
  vscode.call("revealLine", { args = {lineNumber = curline, at = "center"} })
end, { noremap = true, silent = true })


-- setup folding
vim.api.nvim_set_keymap('n', 'j', 'gj', { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', 'k', 'gk', { noremap = false, silent = true })

local vscode = require('vscode')

local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, function() vscode.call(rhs) end, { silent = true, noremap = true })
end

-- setup remapping 
keymap("n", "zM", "<cmd>lua require('vscode').action('editor.foldAll')<CR>", opts)
keymap("n", "zR", "<cmd>lua require('vscode').action('editor.unfoldAll')<CR>", opts)
keymap("n", "zc", "<cmd>lua require('vscode').action('editor.fold')<CR>", opts)
keymap("n", "zC", "<cmd>lua require('vscode').action('editor.foldRecursively')<CR>", opts)
keymap("n", "zo", "<cmd>lua require('vscode').action('editor.unfold')<CR>", opts)
keymap("n", "zO", "<cmd>lua require('vscode').action('editor.unfoldRecursively')<CR>", opts)
keymap("n", "za", "<cmd>lua require('vscode').action('editor.toggleFold')<CR>", opts)

-- Close all but active editor
keymap('n', '<C-a>w', "<cmd>lua require('vscode').action('workbench.action.closeOtherEditors')<CR>", opts)

-- Toggle brekapoint
keymap({"n", "v"}, "<leader>b", "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")

-- Navigate to previuos error in files
keymap({"n", "v"}, "<leader>fe", "<cmd>lua require('vscode').action('editor.action.marker.prevInFiles')<CR>")

-- Navigate to next error in files
 keymap({"n", "v"}, "<leader>fp", "<cmd>lua require('vscode').action('editor.action.marker.nextInFiles')<CR>")

-- toggle fold
keymap("n", "<leader><leader>", "<cmd>lua require('vscode').action('editor.toggleFold')<CR>", opts)

-- close active editor
keymap("n", "<leader>w", "<cmd>lua require('vscode').action('workbench.action.closeActiveEditor')<CR>", opts)

-- close unmodified editors
keymap("n", "<leader>uw", "<cmd>lua require('vscode').action('workbench.action.closeUnmodifiedEditors')<CR>", opts)
