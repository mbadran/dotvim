" identify txt files with no extensions
autocmd BufEnter * if &buftype ==# "nofile" && bufname("") != "VimFortune" | setlocal filetype=scratch | endif

" make untyped files txt by default (annoying because it keeps txt filetype
" settings after the buffer type is changed)
" autocmd BufEnter * if empty(&filetype) | setlocal filetype=txt | endif
