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
" TODO: find a plugin that fixes this
"nnoremap % :call FixPythonMatch()

" TODO: add a mapping to run the python script

" abbreviations {{{1
iabbrev <buffer> ;;l % locals()
iabbrev <buffer> ;;b #! /usr/bin/env python
iabbrev <buffer> ;;i import 
iabbrev <buffer> ;;s self.
