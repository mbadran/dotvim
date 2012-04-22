" don't mess up my tags config, kthx
if has('autocmd')
  augroup unfugitive
    autocmd!
    autocmd BufEnter * setlocal tags=./tags;/
  augroup END
endif
