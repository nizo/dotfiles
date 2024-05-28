vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use("tpope/vim-surround")
    use {
        'mg979/vim-visual-multi',
        branch = 'master',
    }

end)
