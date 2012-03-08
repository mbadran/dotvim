setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
setlocal foldmethod=marker

" show help for the word under the cursor
noremap <F1> :tab help <C-r><C-w><CR>

" automatically source vimrc and gvimrc upon saving
autocmd BufWritePost vimrc,gvimrc source %
