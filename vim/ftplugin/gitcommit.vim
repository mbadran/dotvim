setlocal nonumber norelativenumber
setlocal statusline=\ \ %{GetCWD()}%=%-50{&filetype}
let b:noquickfixsigns = 1

" push after committing
autocmd BufUnload COMMIT_EDITMSG Git push
