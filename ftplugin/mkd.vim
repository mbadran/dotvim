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

" make {{{1

" (you can't create a compiler script for markdown)
let b:makeprgvar='open\ -a\ /Applications/Marked.app\ ' . fnameescape(expand('%:p'))
execute ':setlocal makeprg=' . b:makeprgvar
