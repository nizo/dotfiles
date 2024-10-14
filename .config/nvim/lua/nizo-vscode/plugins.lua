vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
   use 'wbthomason/packer.nvim'
   use("mg979/vim-visual-multi")

   use("tpope/vim-surround")
end)
