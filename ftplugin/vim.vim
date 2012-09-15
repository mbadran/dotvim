" settings {{{1

setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
setlocal foldmethod=marker

" mappings {{{1

" show help for the word under the cursor
" noremap <F1> :tab help <C-r><C-w><CR>
" nnoremap K :tab help <C-r><C-w><CR>
nnoremap K :help <C-r><C-w><CR>
