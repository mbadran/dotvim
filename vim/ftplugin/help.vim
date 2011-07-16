setlocal statusline=\ %{GetDocTitle('help')}%=%h\ %t%40P\ 
let b:noquickfixsigns = 1

if &readonly == 0
  setlocal spell textwidth=78 nowrap
endif
