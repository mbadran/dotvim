" c for [list/special] characters
nnoremap <silent> <leader>c :call ToggleListChars()<CR>

highlight NonText guifg=#002b36
highlight SpecialKey guifg=#002b36
highlight Folded guibg=#002b36
" highlight SignColumn guibg=#073642 guifg=#ffffff
highlight SignColumn guibg=#002b36 guifg=#ffffff
highlight VertSplit guibg=#002b36 guifg=#839496

" hide tildes by default, allow toggle for special chars
function! ToggleListChars() " {{{1
  if exists('w:ListChars')
    highlight NonText guifg=#002b36 guibg=#002b36
    highlight SpecialKey guifg=#002b36 guibg=#002b36
    set nolist
    unlet w:ListChars
  else
    let w:ListChars = 1
    highlight Nontext guifg=#ffffff guibg=#002b36
    highlight SpecialKey guifg=#ffffff guibg=#002b36
    set list
  endif
endfun
