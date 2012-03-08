" enable rooter for ALL source controlled files
augroup rooter
  autocmd!
  autocmd BufEnter * :Rooter
augroup END
