" TODO: verify colours in the console.

" c for [list/special] characters
nnoremap <silent> <leader>c :call ToggleListChars()<CR>

highlight NonText guifg=#002b36 ctermfg=8
highlight SpecialKey guifg=#002b36 ctermfg=8
" highlight Folded gui=bold
highlight Folded guibg=#002b36 ctermbg=8
highlight SignColumn guibg=#073642 ctermbg=0 guifg=#ffffff ctermfg=white
" highlight SignColumn guibg=#002b36 guifg=#ffffff
highlight VertSplit guibg=#002b36 ctermbg=8 guifg=#839496 ctermfg=244

" hide tildes by default, allow toggle for special chars
function! ToggleListChars() " {{{1
  if exists('w:ListChars')
    highlight NonText guifg=#002b36 ctermfg=8 guibg=#002b36 ctermbg=8
    highlight SpecialKey guifg=#002b36 ctermfg=8 guibg=#002b36 ctermbg=8
    set nolist
    unlet w:ListChars
  else
    let w:ListChars = 1
    highlight Nontext guifg=#ffffff ctermfg=white guibg=#002b36 ctermbg=8
    highlight SpecialKey guifg=#ffffff ctermfg=white guibg=#002b36 ctermbg=8
    set list
  endif
endfun

" autocmd InsertEnter * setlocal listchars-=trail:·
" autocmd InsertLeave * setlocal listchars+=trail:·
