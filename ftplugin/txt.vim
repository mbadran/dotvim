setlocal spell tw=80 wrap

if v:version > 702
  setlocal colorcolumn=81

  if has('gui_running')
    highlight colorcolumn ctermbg=grey guibg=#101010
  endif
endif
