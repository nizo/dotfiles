-- synchronize clipboard between WSL and windows
vim.opt.clipboard="unnamedplus"
vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
    },
    cache_enabled = 0,
}

-- load proper profile
--
-- if vim.g.vscode then
-- 	require('nizo-vscode')
-- else 
--     require('nizo')
-- end


--vim.keymap.set("n", "er>pv", vim.cmd.Ex)

vim.api.nvim_set_keymap("n", "J", "5j", {})

if vim.g.vscode then
	vim.cmd[[source $HOME/.config/nvim/nizo-vscode.vimrc]]
else 
	require('nizo')
end
