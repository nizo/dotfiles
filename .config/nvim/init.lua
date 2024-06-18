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
if vim.g.vscode then
	require('nizo-vscode')
else 
	require('nizo')
end
