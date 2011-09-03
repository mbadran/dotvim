" mbadran's gvimrc <github.com/mbadran/dotvim>

" settings {{{1

try
  colorscheme Jellybeans
  set background=dark
catch /E185/
  " ok, use the default color scheme
endtry

" remove the toolbar
set guioptions-=T

" remove the left scrollbar when multiple vsplits present
set guioptions-=L

" TODO: add a bottom scrollbar (when/if Lion style scrollbars are introduced)
"set guioptions+=b

set cursorline

" tab settings
set guitablabel=%M\ %-13.13t\ %N
set guitabtooltip=%F\ (%n)

" default indentation settings (these don't work in .vimrc, for some reason)
set tabstop=4
set softtabstop=4
set shiftwidth=4

" (these don't work in .vimrc, for some reason)
" make quickfix (and :sb* commands) switch to open windows and tabs
" (this breaks :sbuffer -- use :vsp and :spl instead)
set switchbuf=useopen,usetab
" make quickfix open new tabs (splits in <v7) instead of reusing the window
set switchbuf+=split,newtab

" always show the tab bar
set showtabline=2

" macvim: settings {{{1

if has('gui_macvim')
  set macmeta

  set guifont=Meslo\ LG\ S\ DZ:h13'

  " macvim: mappings {{{1
  nnoremap <D-1> 1gt
  nnoremap <D-2> 2gt
  nnoremap <D-3> 3gt
  nnoremap <D-4> 4gt
  nnoremap <D-5> 5gt
  nnoremap <D-6> 6gt
  nnoremap <D-7> 7gt
  nnoremap <D-8> 8gt
  nnoremap <D-9> 9gt

  " add peepopen to the file menu
  anoremenu <silent> .305 File.PeepOpen :PeepOpen<CR>
  macmenu File.PeepOpen key=<D-S-o>

  " repurpose cmd-w to delete the buffer instead of just closing the window
  "macmenu File.Close key=<D-M-w>
  "anoremenu <silent> .328 File.Wipeout\ Buffer :call WipeoutBuffer()<CR>
  "macmenu File.Wipeout\ Buffer key=<D-w>

  " add a menu item to close the tab (for when a tab has multiple splits for
  " which we no longer care)
  anoremenu <silent> .330 File.Close\ Tab :call CloseTab()<CR>
  macmenu File.Close\ Tab key=<D-d>

" for when i'm done with a combination of splits in a tab
"nnoremap <leader>d :tabclose<CR>
"nnoremap <leader><D-d> :tabclose<CR>

  " repurpose cmd-s to :update instead of saving every single time
  macmenu File.Save key=<nop>
  anoremenu <silent> .339 File.Update :call UpdateBuffer()<CR>
  macmenu File.Update key=<D-s>

  " change go to file behaviour to go to a new tab, honouring MacVim's file
  " opening preferences and registering with recent files history
  nnoremap gf :!open -a MacVim <cfile><CR>

  " TODO: change this mapping, ,w? ,c?
  nnoremap <A-w> :close<CR>

" gvim {{{1

elseif (match(v:progname, "gvim") ==? 0)
  set guifont=Lucida_Console:h10:cANSI
  nnoremap <C-tab> gt
  nnoremap <C-S-tab> gT
endif

" mappings {{{1

" fix searches (this doesn't work in .vimrc, for some reason)
noremap / /\v
" (this does, here for consistency only)
noremap ? ?\v

" (this doesn't work in .vimrc, for some reason)
nnoremap <silent> gp :silent !open <cfile><cr>

nnoremap <silent> gf :!open -a MacVim <cfile><cr>

nnoremap <leader>t :tabclose<CR>

" plugin: vimroom {{{1
let g:VimRoom_ShowStatusLine = 0
let g:VimRoom_ZoomLevel = 2
let g:VimRoom_Colorscheme = "DesertEx2"

" autocmds {{{1

" move tabs to the end for new, single buffers (exclude splits)
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif

" TODO: fix. this is bad because you should have just one mapping that does
" The Right Thing. look at bringing back WipeoutBuffer()
function! CloseTab() " {{{1
  try
    tabclose!
  catch /E784/
    close
  endtry
endfunction

function! UpdateBuffer() " {{{1
" only save the buffer when there is something to save
  try
    update
  catch /E32/
    browse confirm saveas
  endtry
endfunction

function! WipeoutBuffer() " {{{1
" don't leave buffers hanging around
  " don't do anything fancy in the command line window (q:)
  if bufname('') == '[Command Line]'
    return
  else
    " if this is the only buffer in the only tab in the gui window, close the whole window
    " TODO: understand and test this some more
    if len(filter(range(1, bufnr('')), 'buflisted(v:val)')) == 1 && tabpagenr('$') == 1
      quit
    else
      "bwipeout
      close
    endif
  endif
endfunction
