if vim.g.vscode then
	vim.cmd[[source $HOME/.config/nvim/init-vscode.vim]]
else 
	require('nizo')
end
