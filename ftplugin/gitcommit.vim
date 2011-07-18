setlocal nonumber norelativenumber

setlocal statusline=%=[Git]
setlocal statusline+=\ %{&readonly?'status':'commit'}
setlocal statusline+=\ %{g:current_branch}
setlocal statusline+=%50(%)

let b:noquickfixsigns = 1

" push after committing
"autocmd BufUnload COMMIT_EDITMSG Git push
