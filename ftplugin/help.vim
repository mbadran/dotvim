"setlocal statusline=\ %{GetDocTitle('help')}%=%h\ %t%40P\ 
"setlocal statusline=\ %{GetDocTitle('help')}%=%h\ %t%40(%)
setlocal statusline=\ %{GetDocTitle('help')}%=%h\ %{matchstr(bufname(''),'.*\\ze\.txt$')}%40(%)
setlocal nospell colorcolumn=
let b:noquickfixsigns = 1
