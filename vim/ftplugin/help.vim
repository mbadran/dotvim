setlocal statusline=\ %{GetDocTitle('help')}%=%h\ %{expand('%:r')}%40P\ 
let b:noquickfixsigns = 1

if &readonly == 1 | setlocal nospell | else | setlocal spell | endif
