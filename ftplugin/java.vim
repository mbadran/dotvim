setlocal tabstop=3 shiftwidth=3 softtabstop=3 expandtab foldnestmax=2
setlocal foldmethod=syntax foldnestmax=2

" TODO: these are probably broken, use a compiler instead
" use ant to make, using a build file above this (src) one
"let b:makeprgvar='ant\ -f\ ' . expand('%:p:h") . '/../build.xml'
let b:makeprgvar='ant\ -f\ ' . '..\build.xml'
execute ':setlocal makeprg=' . b:makeprgvar
execute ":setlocal makeprg=" . b:makeprgvar
