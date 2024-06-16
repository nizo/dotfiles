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

-- vim.api.nvim_set_keymap('n', 'gr', "<Cmd>lua vim.fn.VSCodeNotify('editor.action.referenceSearch.trigger')<CR>", { noremap = true })
-- vim.api.nvim_set_keymap('n', 'u', "<Cmd>lua vim.fn.VSCodeNotify('undo')<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-r>', "<Cmd>lua vim.fn.VSCodeNotify('redo')<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true })

--vim.opt.scrolloff = 8

-- ensure that packer is installed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-surround'
    -- use 'machakann/vim-sandwich'

    -- use {
      --  'mg979/vim-visual-multi',
      --  branch = 'master',
    -- }
end)
