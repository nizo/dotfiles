
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }


vscode = require('vscode')

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- save file
-- keymap('n', '<leader>w', ':w<CR>', opts)

-- Exit insert mode
keymap('i', 'jj', '<Esc>', opts)

-- Insert a new line below and remain in normal mode
keymap('n', '<leader>o', 'o<Esc>', opts)

-- Insert a new line above and remain in normal mode
keymap('n', '<leader>O', 'O<Esc>', opts)

-- Delete current line and past the content of clipboard
keymap('n', 'P', 'pkddyy', opts)

-- Removes highlighting after escaping vim search
keymap('n', '<Esc>', '<Esc>:noh<CR>', opts)

-- Move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- when deleting use black hole register
keymap({"n", "v"}, "d", '"_d', opts)
keymap("n", "dd", '"_dd', opts)

-- Toggle breakpoints
keymap({"n", "v"}, "<leader>b", "<cmd>lua vscode.action('editor.debug.action.toggleBreakpoint')<CR>", opts)

-- Hover
keymap({"n", "v"}, "<leader>d", "<cmd>lua vscode.action('editor.action.showHover')<CR>", opts)

-- View problems
keymap({"n", "v"}, "<leader>sp", "<cmd>lua vscode.action('workbench.actions.view.problems')<CR>", opts)

-- Clear all
keymap({"n", "v"}, "<leader>cn", "<cmd>lua vscode.action('notifications.clearAll')<CR>", opts)

-- Code runner
keymap({"n", "v"}, "<leader>pr", "<cmd>lua vscode.action('code-runner.run')<CR>", opts)

-- Navigate to previuos error in current 
keymap({"n", "v"}, "<leader>e", "<cmd>lua vscode.action('editor.action.marker.prev')<CR>", opts)

-- Navigate to next error in current 
keymap({"n", "v"}, "<leader>p", "<cmd>lua vscode.action('editor.action.marker.next')<CR>", opts)

-- Remap 'n' to search and center the line
keymap("n", "n", function()
  vim.cmd(":norm! n")
  local curline = vim.fn.line(".")
  vscode.call("revealLine", { args = {lineNumber = curline, at = "center"} })
end, { noremap = true, silent = true })

-- Remap 'N' to search backwards and center the line
keymap("n", "N", function()
  vim.cmd(":norm! N")
  local curline = vim.fn.line(".")
  vscode.call("revealLine", { args = {lineNumber = curline, at = "center"} })
end, opts)

-- Remap "gi" to find last insert and center the line
keymap("n", "gi", function()
  vim.cmd("normal! gi")
  local curline = vim.fn.line(".")
  vscode.call("revealLine", { args = {lineNumber = curline, at = "center"} })
end, opts)

-- Remap "gv" to find last select and center the line
keymap("n", "gv", function()
  vim.cmd("normal! gv")
  local curline = vim.fn.line(".")
  vscode.call("revealLine", { args = {lineNumber = curline, at = "center"} })
end, opts)

-- navigation cross folded regions
keymap("n", "j", "gj")
keymap("n", "k", "gk")

-- setup remapping 
keymap("n", "zM", "<cmd>lua vscode.action('editor.foldAll')<CR>", opts)
keymap("n", "zR", "<cmd>lua vscode.action('editor.unfoldAll')<CR>", opts)
keymap("n", "zc", "<cmd>lua vscode.action('editor.fold')<CR>", opts)
keymap("n", "zC", "<cmd>lua vscode.action('editor.foldRecursively')<CR>", opts)
keymap("n", "zo", "<cmd>lua vscode.action('editor.unfold')<CR>", opts)
keymap("n", "zO", "<cmd>lua vscode.action('editor.unfoldRecursively')<CR>", opts)
keymap("n", "za", "<cmd>lua vscode.action('editor.toggleFold')<CR>", opts)

-- Close all but active editor
keymap('n', '<C-a>w', "<cmd>lua vscode.action('workbench.action.closeOtherEditors')<CR>", opts)

-- Toggle breakpoint
keymap({"n", "v"}, "<leader>b", "<cmd>lua vscode.action('editor.debug.action.toggleBreakpoint')<CR>", opts)

-- Navigate to previous error in files
keymap({"n", "v"}, "<leader>fe", "<cmd>lua vscode.action('editor.action.marker.prevInFiles')<CR>", opts)

-- Navigate to next error in files
keymap({"n", "v"}, "<leader>fp", "<cmd>lua vscode.action('editor.action.marker.nextInFiles')<CR>", opts)

-- toggle fold
keymap("n", "<leader><leader>", "<cmd>lua vscode.action('editor.toggleFold')<CR>", opts)

-- close active editor
keymap("n", "<leader>w", "<cmd>lua vscode.action('workbench.action.closeActiveEditor')<CR>", opts)

-- close unmodified editors
keymap("n", "<leader>uw", "<cmd>lua vscode.action('workbench.action.closeUnmodifiedEditors')<CR>", opts)

-- close other editors
keymap("n", "<leader>rw", "<cmd>lua vscode.action('workbench.action.closeOtherEditors')<CR>", opts)
