setlocal nonumber norelativenumber

setlocal statusline=%=[Git\ %{&readonly?'Status':'Commit'}]
"setlocal statusline+=\ %{g:current_branch}
setlocal statusline+=\ %{GetCurrentBranch()}
setlocal statusline+=%50(%)

let b:noquickfixsigns = 1

" push after committing
"autocmd BufUnload COMMIT_EDITMSG Git push
