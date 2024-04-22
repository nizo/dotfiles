" extension default keybindings
" https://github.com/vscode-neovim/vscode-neovim/blob/master/vim/vscode-window-commands.vim

" keybindings
nnoremap gr :call VSCodeNotify('editor.action.referenceSearch.trigger')<CR> 

" References:
" [1] https://github.com/asvetliakov/vscode-neovim/issues/103
" [2] https://github.com/Microsoft/WSL/issues/892

set clipboard=unnamedplus " default
if has('clipboard') || exists('g:vscode') " [1]
    let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point [2]
    if executable(s:clip)
        augroup WSLYank
            autocmd!
            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
        augroup END
    endif
endif

" plugins
call plug#begin()

Plug 'tpope/vim-surround'

call plug#end()

