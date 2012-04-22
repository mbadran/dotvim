" mbadran's gvimrc <github.com/mbadran/dotvim>

" TODO: find a way to capture all files opened and add them to macvim's
" recently opened files. or just give up and use a native plugin.
" TODO: add more cmd hotkeys for common tasks, like commenting, etc

" settings {{{1

try
  set background=dark
  colorscheme solarized
catch /E185/
  " ok, use the default color scheme
endtry

" remove the toolbar
set guioptions-=T

" remove the left scrollbar when multiple vsplits present
set guioptions-=L

" tab settings
set guitablabel=%M\ %-13.13t\ %N
set guitabtooltip=%F\ (%n)

" always show the tab bar
set showtabline=2

" macvim: settings {{{1

if has("gui_macvim")
  set macmeta

  set guifont=Meslo\ LG\ S\ DZ:h13'

  " remove the right scrollbar for now (ugly in Lion)
  set guioptions-=r

  " TODO: add a bottom scrollbar (when/if Lion style scrollbars are introduced)
  " set guioptions+=b

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

  " repurpose cmd-w to close the tab, and cmd-d to close the buffer
  " macmenu File.Close key=<D-d>
  anoremenu <silent> .328 File.Close\ Tab :call CloseTab()<CR>
  " macmenu File.Close\ Tab key=<D-w>
  macmenu File.Close\ Tab key=<D-d>

  " repurpose cmd-s to :update instead of saving every single time
  macmenu File.Save key=<nop>
  anoremenu <silent> .339 File.Update :call UpdateBuffer()<CR>
  macmenu File.Update key=<D-s>

  " change go to file behaviour to go to a new tab, honouring MacVim's file
  " opening preferences and registering with recent files history
  nnoremap <silent> gf :silent !open -a MacVim <cfile><CR>

  " open urls in the default browser
  nnoremap <silent> gb :silent !open <cfile><CR>

  " map omnicompletion shortcuts (corresponding to their <c-x><c-?> letter
  " (:help ins-completion)
  " dictionary
  inoremap <C-K> <C-X><C-K>
  " spelling
  inoremap <C-S> <C-X><C-S>
  " tags
  inoremap <C-]> <C-X><C-]>
  " file names
  inoremap <C-F> <C-X><C-F>
  " vim/ex commands
  inoremap <C-V> <C-X><C-V>
  " thesaurus (not configured)
  " inoremap <C-T> <C-X><C-T>
  " current and included files (unnecessary)
  " inoremap <C-I> <C-X><C-I>
  " definitions or macros (for c programs, unnecessary)
  " inoremap <C-D> <C-X><C-D>
  " user defined (none)
  " inoremap <C-U> <C-X><C-U>
  " omnicompletion (handled by supertab, overrides 'jump to normal mode')
  " inoremap <C-O> <C-X><C-O>
  " whole lines (broken)
  " inoremap <C-L> <C-L>
  " current file (handled by supertab, and <C-N> is already mapped to 'complete')
  " inoremap <C-N> <C-X><C-N>

" gvim {{{1

elseif (v:progname ==? "gvim")
  set guifont=Lucida_Console:h10:cANSI
  nnoremap <C-tab> gt
  nnoremap <C-S-tab> gT
endif

" mappings {{{1

" plugin: vimroom {{{1
let g:VimRoom_ShowStatusLine = 0
let g:VimRoom_ZoomLevel = 2
let g:VimRoom_Colorscheme = "DesertEx2"

" autocmds {{{1

" if the tabline is enabled, a new buffer is opened, and there are no splits,
" then this is probably a new tab. move it to the end. (NOTE: enew will
" trigger this action too, unfortunately)
autocmd BufNew * if &showtabline && winnr("$") == 1 | tabmove | endif

function! CloseTab() " {{{1
  try
    tabclose!
  catch
    quit
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
