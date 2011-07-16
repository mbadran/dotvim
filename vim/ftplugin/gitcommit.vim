setlocal nonumber norelativenumber
setlocal statusline=\ \ %{GetCWD()}%=%-50{&filetype}
let b:noquickfixsigns = 1

" commit and push on save (just don't save til you're ready)
autocmd BufWritePost COMMIT_EDITMSG Git push
