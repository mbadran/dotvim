" settings {{{1
" PEP8 (minus textwidth=79)
setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" compiler {{{1
" use a compiler plugin for this (not necessary ATM because of syntastic)
"execute ":setlocal makeprg=python\\ ./" . expand('%:t')

" docs {{{1
setlocal keywordprg=pydoc

" mappings {{{1
" TODO: make this support a range as well, for when you don't want the whole
" module (needs visual mode support)
nnoremap <F1> :Pydoc <C-r><C-w><CR>

" TODO: add a mapping to run the python script

" abbreviations {{{1
inoreabbrev <buffer> ;;l % locals()
inoreabbrev <buffer> ;;b #! /usr/bin/env python
inoreabbrev <buffer> ;;i import 
inoreabbrev <buffer> ;;s self.

"noreabbrev <expr> c resolve("%:p:h") . "/"
"inoreabbrev <expr> ;;k resolve("%:p:h") . "/"
"inoreabbrev <buffer> ;;l resolve("%:p:h") . "/"
"inoreabbrev <buffer> <expr> ;;m resolve("%:p:h") . "/"
"inoreabbrev <buffer> ;;n hello there
"iabbrev <expr> ;;o hi there
"inoreabbrev <script> ;;y gday there
"inoreabbrev <script> <buffer> ;;z yo there
