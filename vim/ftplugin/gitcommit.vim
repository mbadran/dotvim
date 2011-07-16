setlocal nonumber norelativenumber
setlocal statusline=\ \ %{GetCWD()}%=%-50{&filetype}
let b:noquickfixsigns = 1

" TODO: test if both lines work
autocmd BufWritePost gitcommit Git push | diffoff | silent only | TagbarOpen
"autocmd BufWritePost COMMIT_EDITMSG Git push
