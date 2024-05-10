" extension default keybindings
" https://github.com/vscode-neovim/vscode-neovim/blob/master/vim/vscode-window-commands.vim

" keybindings
nnoremap gr :call VSCodeNotify('editor.action.referenceSearch.trigger')<CR> 

nmap <silent> u <Cmd>call VSCodeNotify('undo')<CR>
nmap <silent> <C-r> <Cmd>call VSCodeNotify('redo')<CR>



nmap n nzz
nmap N Nzz
" nmap * *zz
" nmap # #zz
" nmap g* g*zz
" nmap g# g#zz

" References:
" [1] https://github.com/asvetliakov/vscode-neovim/issues/103
" [2] https://github.com/Microsoft/WSL/issues/892

set clipboard=unnamedplus
set scrolloff=8

" if has('clipboard') || exists('g:vscode') " [1]
"    let s:clip = '/mnt/c/Windows/System32/clip.exe' 
"    if executable(s:clip)
"        augroup WSLYank
"            autocmd!
"            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
"        augroup END
"    endif
"endif

" plugins
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

