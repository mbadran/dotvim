" first line should be <= 50 chars, detail should be <= 72 char per line
" (according to tpope)
"setlocal cursorcolumn colorcolumn=72

"setlocal colorcolumn=72
"highlight colorcolumn ctermbg=grey guibg=#101010

setlocal nonumber norelativenumber
setlocal statusline=\ \ %{GetCWD()}%=%-50{&filetype}
let b:noquickfixsigns = 1

" TODO: test if both lines work
"autocmd BufWritePost gitcommit Git push
autocmd BufWritePost COMMIT_EDITMSG Git push
