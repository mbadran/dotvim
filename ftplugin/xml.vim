" settings {{{1

setlocal tabstop=2 shiftwidth=2
"inoreabbrev <buffer> ;;cd <![CDATA[<CR><CR>]]><Esc>-i<Tab>
"inoreabbrev ;;cd cdata

" abbreviations {{{1

cnoreabbrev <expr> ;;g expand("%:p:h") . "/"
