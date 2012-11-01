" settings {{{1

setlocal tabstop=4
setlocal shiftwidth=4
" make backspace in indent mode treat 4 spaces like a tab
setlocal softtabstop=4
setlocal expandtab

" unset _ as a word delimiter (this will allow jump-to-definition to work)
setlocal iskeyword+=_

" undo pymode's silly setting
" setlocal relativenumber

" abbreviations {{{1
" TODO: consider using snipmate for this stuff

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

" mappings {{{1
