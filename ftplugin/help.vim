"setlocal statusline=\ %{GetDocTitle('help')}%=%h\ %t%40P\ 
"setlocal statusline=\ %{GetDocTitle('help')}%=%h\ %t%40(%)
"setlocal statusline=\ %{GetDocTitle('help')}%=%h\ %{matchstr(bufname(''),'.*\\ze\.txt$')}%40(%)
setlocal statusline=\ %{GetDocTitle('help')}%=%h\ %{matchstr(bufname(''),'[^/]*\\ze\.txt$')}%40(%)
setlocal nospell

if v:version > 702
  setlocal colorcolumn=
endif

let b:noquickfixsigns = 1
