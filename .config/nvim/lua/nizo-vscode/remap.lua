
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vscode = require('vscode')

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Helper to run a normal command safely and center the cursor in VSCode
local function safe_normal_and_center(cmd)
  return function()
    local ok = pcall(vim.cmd, "normal! " .. cmd)  -- safely execute normal command
    if ok then
      local curline = vim.fn.line(".")
      vscode.call("revealLine", { args = { lineNumber = curline, at = "center" } })
    end
  end
end

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
keymap("n", "n", safe_normal_and_center("n"), opts)

-- Remap 'N' to search backwards and center the line
keymap("n", "N", safe_normal_and_center("N"), opts)

-- Remap "gi" to find last insert and center the line
keymap("n", "gi", safe_normal_and_center("gi"), opts)

-- Remap "gv" to find last select and center the line
keymap("n", "gv", safe_normal_and_center("gv"), opts)

-- Find previous occurence of word under the cursor
keymap("n", "*", safe_normal_and_center("*"), opts)

-- Find next occurence of word under the cursor
keymap("n", "#", safe_normal_and_center("#"), opts)

-- Allow navigation across folded regions
keymap('n', 'j', "<Cmd>call VSCodeCall('cursorMove', { 'to': 'down', 'by': 'wrappedLine', 'value': 1 })<CR>", opts)
keymap('n', 'k', "<Cmd>call VSCodeCall('cursorMove', { 'to': 'up', 'by': 'wrappedLine', 'value': 1 })<CR>", opts)
-- keymap("n", "j", "gj", opts)
-- keymap("n", "k", "gk", opts)

-- Setup remapping 
keymap("n", "zM", "<cmd>lua vscode.action('editor.foldAll')<CR>", opts)
keymap("n", "zR", "<cmd>lua vscode.action('editor.unfoldAll')<CR>", opts)
keymap("n", "zc", "<cmd>lua vscode.action('editor.fold')<CR>", opts)
keymap("n", "zC", "<cmd>lua vscode.action('editor.foldRecursively')<CR>", opts)
keymap("n", "zo", "<cmd>lua vscode.action('editor.unfold')<CR>", opts)
keymap("n", "zO", "<cmd>lua vscode.action('editor.unfoldRecursively')<CR>", opts)
keymap("n", "za", "<cmd>lua vscode.action('editor.toggleFold')<CR>", opts)


-- Toggle breakpoint
keymap({"n", "v"}, "<leader>b", "<cmd>lua vscode.action('editor.debug.action.toggleBreakpoint')<CR>", opts)

-- Navigate to previous error in files
keymap({"n", "v"}, "<leader>l", "<cmd>lua vscode.action('editor.action.marker.prevInFiles')<CR>", opts)

-- Navigate to next error in files
keymap({"n", "v"}, "<leader>h", "<cmd>lua vscode.action('editor.action.marker.nextInFiles')<CR>", opts)

-- Toggle fold
keymap("n", "<leader>f", "<cmd>lua vscode.action('editor.toggleFold')<CR>", opts)

-- Close active editor
keymap("n", "<leader>w", "<cmd>lua vscode.action('workbench.action.closeActiveEditor')<CR>", opts)

-- Close unmodified editors
keymap("n", "<leader>uw", "<cmd>lua vscode.action('workbench.action.closeUnmodifiedEditors')<CR>", opts)

-- Close all but active editor
keymap("n", "<leader>rw", "<cmd>lua vscode.action('workbench.action.closeOtherEditors')<CR>", opts)

-- Trigger find all
keymap("n", "<leader>s", "<cmd>lua vscode.action('workbench.action.findInFiles')<CR>", opts)

-- Toggle sidebar visibility
keymap("n", "<leader><leader>", "<cmd>lua vscode.action('workbench.action.toggleSidebarVisibility')<CR>", opts)

-- Navigate via all primary sidebar types
keymap("n", "<leader>1", "<cmd>lua vscode.action('workbench.view.explorer')<CR>", opts)
keymap("n", "<leader>2", "<cmd>lua vscode.action('workbench.view.search')<CR>", opts)
keymap("n", "<leader>3", "<cmd>lua vscode.action('workbench.view.scm')<CR>", opts)
keymap("n", "<leader>4", "<cmd>lua vscode.action('workbench.view.debug')<CR>", opts)
keymap("n", "<leader>5", "<cmd>lua vscode.action('workbench.view.extensions')<CR>", opts)
keymap("n", "<leader>6", "<cmd>lua vscode.action('workbench.view.testing')<CR>", opts)

-- Yank the current word under the cursor and open findInFiles sidebar
keymap(
  "n",
  "<leader>*",
  "<cmd>normal! yiw<CR><cmd>lua vscode.action('workbench.action.findInFiles')<CR>",
  opts
)
