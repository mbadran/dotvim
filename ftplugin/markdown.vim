" settings {{{1

setlocal spell
setlocal textwidth=80

" partially display wrapped lines at the bottom of the screen
setlocal display=lastline

" reformat paragraphs as you type
setlocal formatoptions+=a

" highlight the last column
if v:version > 702
  setlocal colorcolumn=81
endif

" mappings {{{1

" undo one sentence at a time in insert mode
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap : :<C-g>u
inoremap ; ;<C-g>u

" run {{{1

nnoremap <buffer> <silent> <leader>r :echomsg "Running in Marked..."<CR><Bar>:silent !open -a /Applications/Marked.app %<CR>

" commands {{{1

" complete from dictionary by default
" call SuperTabSetDefaultCompletionType('<c-x><c-k>')
