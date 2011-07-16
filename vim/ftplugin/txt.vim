" don't apply these settings for help files (which are also .txt)
if &filetype != 'vim'
  setlocal spell tw=80 wrap

  setlocal colorcolumn=81
  highlight colorcolumn ctermbg=grey guibg=#101010
endif
