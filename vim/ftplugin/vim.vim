setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
setlocal foldmethod=marker

" show help for the word under the cursor
noremap <F1> :help <C-r><C-w><CR>

" automatically source the vimrc file after saving
"autocmd BufWritePost .vimrc,_vimrc source $MYVIMRC
"autocmd BufWritePost .gvimrc,_gvimrc source $MYGVIMRC
