" mbadran's vimrc <github.com/mbadran/dotvim>

" bundles: boilerplate {{{1
set runtimepath+=$HOME/.vim/bundle/vundle/
try
  call vundle#rc()

  " let vundle manage vundle
  Bundle 'gmarik/vundle'

  " bundles: github {{{1

  Bundle 'Lokaltog/vim-powerline'
  Bundle 'Raimondi/delimitMate'
  Bundle 'airblade/vim-rooter'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'bkad/CamelCaseMotion'
  Bundle 'davidoc/taskpaper.vim'
  Bundle 'ervandew/supertab'
  Bundle 'gregsexton/MatchTag'
  Bundle 'klen/python-mode'
  Bundle 'majutsushi/tagbar'
  Bundle 'michaeljsmith/vim-indent-object'
  Bundle 'mikewest/vimroom'
  Bundle 'plasticboy/vim-markdown'
  Bundle 'scrooloose/syntastic'
  Bundle 'shemerey/vim-peepopen'
  Bundle 'sickill/vim-pasta'
  Bundle 'sjl/gundo.vim'
  Bundle 'skammer/vim-css-color'
  Bundle 'sukima/xmledit'
  " required by quickfixsigns
  Bundle 'tomtom/tlib_vim'
  Bundle 'tomtom/quickfixsigns_vim'
  Bundle 'tpope/vim-commentary'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-repeat'
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-unimpaired'
  Bundle 'tyru/regbuf.vim'
  Bundle 'xolox/vim-easytags'

  " bundles: vim-scripts {{{1

  Bundle 'AfterColors.vim'
  Bundle 'Rename'
  Bundle 'SearchComplete'
  Bundle 'argtextobj.vim'
  Bundle 'closetag.vim'
  " Bundle 'sessionman.vim'

catch /E117/ | endtry    " no vundle

" bundles: mine {{{1

set runtimepath+=$HOME/.vim/mundle/findinfiles
set runtimepath+=$HOME/.vim/mundle/headlights
set runtimepath+=$HOME/.vim/mundle/instaruler
set runtimepath+=$HOME/.vim/mundle/snide
set runtimepath+=$HOME/.vim/mundle/spacedebris
" set runtimepath+=$HOME/.vim/mundle/jpythonfold.vim
" set runtimepath+=$HOME/.vim/mundle/sessionfridge
" set runtimepath+=$HOME/.vim/mundle/vimroom

" settings {{{1

let g:mapleader = ','
let g:maplocalleader = '\\'

filetype indent plugin on

" enable syntax highlighting
syntax on

" enable case insensitive search when using lowercase letters
set ignorecase
set smartcase

" enable case insensitive keyword completion when ignorecase is on
set infercase

" allow backspacing over autoindent, line breaks, and start of insert action
set backspace=indent,eol,start

" go to the first non-blank of the line instead of the start (where possible)
set nostartofline

" always display the status line
set laststatus=2

" don't fail commands because of unsaved changes
set confirm

" don't beep or flash
set visualbell
set t_vb=

" highlight the line the cursor is on
set cursorline

" enable the mouse in all modes
set mouse=a

" avoid most prompts to continue
set cmdheight=3

" time out quickly on mappings
set timeout
set timeoutlen=500

" time out even more quickly on keycodes
set ttimeout
set ttimeoutlen=200

" keep all modified buffers visible
"set nohidden

" enhance command line completion
set wildmenu

" show partial commands at the bottom
set showcmd

" highlight search matches
set hlsearch

" hide the intro message on startup
set shortmess+=I

" keep the cursor in the middle of the window
set scrolloff=999

" put new :vsplits windows on the right
set splitright

" put new :split windows below
set splitbelow

" search as you type
set incsearch

" jump to matching brackets
set showmatch

" highlight the line the cursor is on (in the current window)
if has('autocmd')
  autocmd WinEnter,InsertLeave * if !IsSpecialBuffer() | setlocal cursorline | endif
  autocmd WinLeave,InsertEnter * if !IsSpecialBuffer() | setlocal nocursorline | endif
endif

" use these file formats when reading and creating files
set fileformats=unix,dos,mac

" wrap long lines
set linebreak

" update open files when they're changed externally
set autoread

" automatically save before certain commands
set autowriteall

" let h and l traverse lines too
set whichwrap+=h,l

" search globally by default (use /g flag for first match only)
set gdefault

if v:version > 702
  " show line numbers relative to the cursor position
  set relativenumber

  " change to dir of the current file automatically
  set autochdir

  " allow persistent undos across sessions
  set undofile

  " save undo files far away (put the full dir path in the filename)
  set undodir=$TEMP//,$TMP//,$TMPDIR//,.
else
  " change to dir of the current file automatically
    lcd %:p:h
endif

" don't create swap files
set noswapfile

" save backup files far away (put the full dir path in the filename)
" // expands to full dir path, not just filename (doesn't work on windows)
set backupdir=$TEMP//,$TMP//,$TMPDIR//,.
set backup

" list all matches and complete till longest common string
" (tab twice to cycle through)
set wildmode=list:longest,list:full

" specify the symbols for unprintable chars
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:○,extends:→,precedes:←

" specify the language for spelling corrections
set spelllang=en_au

" specify a file for good spellings
set spellfile=$HOME/.vim/spell/general.utf-8.add

" specify the dictionary files for keyword completion
set dictionary+=/usr/share/dict/words

" specify the fill characters
set fillchars=vert:\\,fold:·

" add only one space when joining lines
set nojoinspaces

" stop cursor from blinking in normal mode
set guicursor+=n:blinkon0

" use the system clipboard as the default register
set clipboard=unnamed

" only save tabs when making sessions
set sessionoptions=tabpages

" limit the number of menu items for omnicompletion (temporary hack)
set pumheight=17

" let the cursor move past the end of the line (helps with b movements)
" set virtualedit=onemore

" show more information while completing tags
set showfulltag

" always report number of lines changed
" setting to 1 for now -- too much noise
set report=1

" retain more history items
" set history=1000
set history=100

" match angle brackets too
set matchpairs+=<:>

" don't make windows the same size
set noequalalways

" speed up background operations
"set updatetime=1000
" slow it down for easytags
set updatetime=4000

" unset these as word delimiters
set iskeyword+=$,%,#

" set these as word delimiters
set iskeyword-=_

" set grep options (i just use vimgrep these days, though)
" set grepprg=grep\ -nHi $* /dev/null
" set grepprg=grep\ -nHi\ $*
set grepprg=ack

" indentation {{{1

" default indentation settings
" match the current indent for new lines
set autoindent

" insert spaces instead of tabs
set expandtab

" indent/outdent to nearest tabstops
set shiftround

" ignore files with these extensions when completing filenames
" set suffixes+=.class,.exe,.o,.obj,.dat,.dll,.aux,.pdf,.gch
set suffixes+=.pdf

" ignore whitespace for diff
set diffopt+=iwhite

" autocmds {{{1

if has('autocmd')
  augroup vimrc
    " reset all autocmds for quick re-sourcing
    autocmd!

    " identify txt files with no extensions
    autocmd BufRead README,INSTALL set filetype=txt

    " configure command line buffers {{{1
    autocmd FileType * if bufname('') == '[Command Line]' | setlocal nonumber norelativenumber | endif

    " enable omnicompletion by default
    autocmd FileType * if &omnifunc == '' | setlocal omnifunc=syntaxcomplete#Complete | endif

    " automatically close the preview window
    autocmd CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif

    " open the previous position in the file
    autocmd BufReadPost * call GoToLastPosition()

    " automatically source vimrc and gvimrc upon saving
    autocmd BufWritePost vimrc,gvimrc source %
  augroup END
endif

" mappings: all {{{1

" go to end of previous word with a single key (ge, gE)
" noremap M ge
noremap M gE

" go to beginning and end of line more easily (see associated text-objects)
noremap H 0
noremap L $
noremap <silent> H :call GoToStartOfLine()<CR>
noremap <silent> L :call GoToEndOfLine()<CR>

" toggle folds more easily
nnoremap <CR> za
nnoremap <silent> <S-CR> :silent call ToggleAllFolds()<CR>
nnoremap <silent> <C-CR> zMzv

" swap mark commands
noremap ' `
noremap ` '

" swap the default movements on wrapped lines
noremap j gj
noremap k gk
noremap 0 g0
noremap $ g$
noremap gj j
noremap gk k
noremap g0 0
noremap g$ $

" mappings: normal {{{1

" make Y behave like D and C, not yy
nnoremap Y y$

" overload Esc to also clear search matches
nnoremap <silent> <Esc> <Esc>:nohlsearch<CR>

" simplify window operations
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" invoke command line mode with one key
" nnoremap <Space> :
" enter commandline window by default with <Space>
nnoremap <Space> q:i
vnoremap <Space> q:i

" repeat one off macros quickly
nnoremap <leader>. @q

" use <Tab> for % matching and <C-p> for jumping forwards
" (<Tab> and <C-i> are the same as far as Vim is concerned)
nnoremap <C-p> <Tab>
vnoremap <C-p> <Tab>

" now, we can use <Tab> to jump between matches
nnoremap <Tab> %
vnoremap <Tab> %

" unwindows
nnoremap <silent> <leader>vw :%s/\r//e<Bar>set fileformat=unix<CR>

" follow the symlinks so we can check in changes
nnoremap <silent> <leader>vv :execute "tabedit " . resolve($MYVIMRC)<CR>
nnoremap <silent> <leader>vg :execute "tabedit " . resolve($MYGVIMRC)<CR>
nnoremap <silent> <leader>vs :update<Bar>source %<CR>
nnoremap <silent> <leader>vt :tabedit ~/Dropbox/todo/1_Life.taskpaper<CR>

nnoremap <silent> <leader>b :buffers<CR>

nnoremap <leader>h :help<Space>

" don't use ex mode, do formatting instead
nnoremap Q gqip
vnoremap Q gq

" toggle between paste and nopaste modes (i don't use this ATM)
nnoremap <leader>P :setlocal invpaste paste?<CR>

" toggle wrap
nnoremap <leader>W :setlocal invwrap wrap?<CR>

" show the paste registers
nnoremap <leader>r :registers<CR>

" reselect text that was just pasted
nnoremap <leader>v V`]

" don't move on matches
nnoremap * *<C-O>
nnoremap # #<C-O>

" mappings: visual {{{1

" reselect after an indent action (to facilitate repeat actions)
vnoremap > >gv
vnoremap < <gv

" mappings: command {{{1

" do a sudo write
cnoremap w!! w !sudo tee % > /dev/null

" fix searches
cnoremap %s/ %s/\v
cnoremap %g/ %g/\v

cnoremap <expr> ;;p expand("%:p:h") . "/"

" mappings: insert {{{2

"inoremap <C-S-Space> <C-x><C-o>

inoremap <C-B> <C-O>yB<End>=<C-R>=<C-R>0<CR>

" mappings: operator-pending {{{1

" abbreviations {{{1

" commands {{{1

command! DiffOrig vertical new | set buftype=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

" text-object: H {{{1

vnoremap tH t0
onoremap tH :normal VtH<CR>
vnoremap TH T0
onoremap TH :normal VTH<CR>

" text-object: L {{{1

vnoremap tL t$
onoremap tL :normal VtL<CR>
vnoremap TL T$
onoremap TL :normal VTL<CR>

" textobject: fold {{{1

vnoremap af :<C-U>silent! normal! [zV]z<CR>
onoremap af :normal Vaf<CR>

" textobject: square {{{1

vnoremap iq i[
vnoremap aq a[
onoremap iq i[
onoremap aq a[

" textobject: curly {{{1

vnoremap ic i{
vnoremap ac a{
onoremap ic i{
onoremap ac a{

" textobject: angle {{{1

vnoremap ia i<
vnoremap aa a<
onoremap ia i<
onoremap aa a<

" terminal {{{1

if !has('gui_running')
  set t_Co=256
  set background=dark

  try
    colorscheme solarized
  catch /E185/
    colorscheme zellner
  endtry

  set nocursorline
  set title

  if v:version > 702
    set colorcolumn=81
  endif
  " the c key is pressed upon entering, for some reason
  "normal <Esc>
endif

" plugin: runtime {{{1

runtime! macros/matchit.vim
runtime! ftplugin/man.vim

" plugin: peepopen {{{1

"disable default mapping so we can reuse it
map <nop> <Plug>PeepOpen

" plugin: headlights {{{1

"let g:headlights_use_plugin_menu = 1
"let g:headlights_debug_mode = 1
let g:headlights_show_files = 1
let g:headlights_show_load_order = 1
"let g:headlights_show_commands = 0
"let g:headlights_show_mappings = 0
let g:headlights_show_abbreviations = 1
let g:headlights_show_functions = 1
" let g:headlights_smart_menus = 0
let g:headlights_show_highlights = 1

" plugin: syntastic {{{1

" this needs to be set here for some reason
let g:syntastic_enable_signs = 1

" plugin: supertab {{{1

"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabRetainCompletionDuration = "session"

" plugin: rooter {{{1

let g:rooter_use_lcd = 1

" plugin: quickfixsigns {{{1

" don't show quickfix vcsdiff signs
let g:quickfixsigns_classes = ['qfl', 'loc', 'marks', 'breakpoints']
let g:quickfixsigns_blacklist_buffer = '^__.*__\|\[.*$'
let g:quickfixsigns#marks#texthl = 'SignColumn'
let g:quickfixsigns_icons = {}

" plugin: camelcase " {{{1

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" plugin: easytags " {{{1

let g:easytags_cmd = '/usr/local/bin/ctags'

" plugin: csscolor " {{{1

let g:cssColorVimDoNotMessMyUpdatetime = 1

" plugin: powerline " {{{1

let g:Powerline_symbols = 'fancy'

" plugin: solarized " {{{1

let g:solarized_menu = 0

function! GetFileFormat() " {{{1
  return &fileformat == 'unix' ? '' : toupper(&fileformat) . '!'
endfunction

function! GetCWD() " {{{1
  let l:cwd = substitute(getcwd(), $HOME . '\ze.*$', '~', '')
  return strlen(l:cwd) > 50 ? strpart(l:cwd, 0, 50) . '>' : l:cwd
endfunction

function! IsSpecialBuffer() " {{{1
  if &filetype == 'tagbar' || &filetype == 'nerdtree' || &filetype == 'help' || &filetype == 'qf' || &filetype == 'man' || &filetype == 'gitcommit' || &filetype == 'preview' || bufname('') == '[Command Line]' 
    return 1
  endif
  return 0
endfunction

" TODO: deprecate, incorporate into a powerline theme
function! SetStatusline() " {{{1
  if !IsSpecialBuffer()
    setlocal statusline=\ \ \ \ \ \ %{GetCWD()}            " current dir (always force 6 leading spaces)
    setlocal statusline+=\ %{GetNextError()}               " syntastic errors (for quiet mode)
    setlocal statusline+=%=                                " right divider
    setlocal statusline+=%-7w                              " preview window tag (if applicable)
    setlocal statusline+=\ %{&filetype}                    " filetype (if exists)
    setlocal statusline+=\ %-7{GetFileFormat()}            " fileformat (if not unix)
    setlocal statusline+=\ %-5{GetCurrentBranch()}         " git branch
    setlocal statusline+=%30(%7v%*%)                       " current column or virtual column
    setlocal statusline+=%15(%l%*\ of\ %L%)\               " current line and total lines
  endif
endfunction

" TODO: deprecate, incorporate into a powerline theme
function! SetStatuslineNC() " {{{1
  if !IsSpecialBuffer()
    setlocal statusline=\ \ \ \ \ \ %f
    setlocal statusline+=%=
    setlocal statusline+=%-7w
    setlocal statusline+=\ %-50{&filetype}
  endif
endfunction

function! GoToLastPosition() " {{{1
  if line("'\"") > 0 && line("'\"") <= line('$')
    execute "normal g`\""
  endif
endfunction

function! ToggleAllFolds() " {{{1
  if &foldlevel == 0
    "normal zR
    setlocal foldlevel=99
  else
    "normal zM
    setlocal foldlevel=0
  endif
endfunction

function! GoToStartOfLine() " {{{1
  " save current cursor pos
  let s:save_col = getpos(".")[2]

  normal _

  let s:new_col = getpos(".")[2]

  " if we haven't moved, and we're not at the beginning, go to the beginning
  if s:save_col == s:new_col && s:new_col > 1
    normal 0
  endif
endfunction

function! GoToEndOfLine() " {{{1
  " save current cursor pos
  let s:save_col = getpos(".")[2]

  normal g_

  let s:new_col = getpos(".")[2]

  " if we haven't moved, and we're not at the end, go to the end
  if s:save_col == s:new_col && s:new_col < len(getline('.'))
    normal $
  endif
endfunction

" TODO: deprecate, incorporate into a powerline theme
function! GetDocTitle(command) " {{{1
  try
    let l:title = matchstr(@:, '^' . a:command . '.*')
    return empty(l:title) ? '' : ':' . l:title
  catch /E30/
    return ''
  endtry
endfunction

" TODO: deprecate, incorporate into a powerline theme
function! GetQuickFixTitle() " {{{1
  return !exists('w:quickfix_title') ? '' : ':' . matchstr(w:quickfix_title, '^:\?\s*\zs.\+')
endfunction

" TODO: deprecate, incorporate into a powerline theme
function! GetCurrentBranch() " {{{1
  try
    let l:current_branch = matchstr(fugitive#statusline(), '(\zs.*\ze)')
  catch /E117/
    " fugitive is not loaded (faster than having a condition just for one edge case)
    return ''
  endtry

  if empty(l:current_branch)
    return ''
  endif

  silent let l:status = empty(system("git status -s"))? '' : '!'

  return '<' . l:current_branch . l:status . '>'
endfunction

" TODO: deprecate, incorporate into a powerline theme
function! GetNextError() " {{{1
  return !exists('g:loaded_syntastic_plugin') ? '' : SyntasticStatuslineFlag()
endfunction

" cheatsheet {{{1

" TODO: add cheatsheet items for everything you want to improve -- marks,
" registers, etc. only way you'll learn if you have an immediate reference.
" also: sessions, movement commands (as per the grok vim post), etc
" also: c-r shortcuts in insert mode, refomratting, etc. see list in todos.

" '. goes to previously edited line
" `. goes to previous column on previously edited line
" gi goes to previous column on previously edited line, putting you in insert
" mode.
"
" U -- undo all changes on the line
" ctrl-w ] will open the tag/function/method in a split -- better than jumping
" back and forth, especially when you still want to see the invoking code
"
" <C-x><C-k> to invoke spelling dictionary
" TODO: add more omnicomplete keywords here
"
" select the just pasted text: V`]
"
" W - beginning of next word defined by only space boundaries
" E - end of current/next word defined by only space boundaries
" B - beginning of current/previous defined by only space boundaries

" mode() tells you the mode
"
" %s/pattern//gn number of occurrences of pattern

"g; and g, to cycle back and forth through your last edits

" g<c-g> shows you doc stats, g2<c-g> shows you file stats -- file name, line number, col number, etc
" ge goes to the end of the previous word (isn't be the same or faster?
" gE goes to the end of the previous 'full' word
" if you just want to go to the end of the previous word, ge or gE is the way
" to go. otherwise, if you want to jump a few words, it's faster and easier to
" just use 'b', then 'e' or 'E' once you reach the word you want.

" ex commands are awesome: g/setlocal/ normal I"
" http://blog.sanctum.geek.nz/using-more-of-ex/

" http://henrik.nyh.se/2011/01/textmate-to-vim-with-training-wheels
" 80i-<Esc>
" YpVr=
" das
" dis
" cas
" cis
" d(
" d2(
"
" f<char> -> then -> c; or c, to d; d, to delete to that line operation mark

" gP pastes the text before the current char, and leaves the cursor on the
" current char. whereas P pastes the text before the current char, and moves
" the cursor to the end of the pasted text (one to the left of the previous
" char)

" g_ is to $ what ^ is to 0

" g`" goes to the last cursor position in the file

" gv - repeat the last selection

" g; and g, to jump around (look up using help)

" x is dl -- X is dh

" ]p to paste with indentation

" gqq reformats the current line

" ci(” can be replaced with “cib”
" ci{” can be replaced with “ciB”
" cit for tags

" q: — Open with a command history from normal mode
" q/ — Open with a search history from normal mode (to seach forward)
" q? — Open with a search history from normal mode (to seach backward)
" Ctrl+F — Open with a command history from command mode

" gu<motion> -- lowercase
" gU<motion> -- UPPERCASE

" :map <keys> -- find the mapping corresponding to <keys>
"
" folding
"za toggles a fold opened and closed!
"zf#j  creates a fold from the cursor down  #  lines.
"zf/string creates a fold from the cursor to string .
"zj moves the cursor to the next fold.
"zk moves the cursor to the previous fold.
"zo opens a fold at the cursor.
"zO opens all folds at the cursor.
"zm increases the foldlevel by one.
"zM closes all open folds.
"zr decreases the foldlevel by one.
"zR decreases the foldlevel to zero -- all folds will be open.
"zd deletes the fold at the cursor.
"zE deletes all folds.
"[z move to start of open fold.
"]z move to end of open fold.

" use the following command to debug:
" vim -N -u NONE -U NONE
" this will let you call vim in nocompatible mode, with no vimrc and no gvimrc
" settings
" then you can source ~/.vimrc and check that everything works in a cross
" platform way

" todo {{{1

" TODO: bring back your statusline adjustments (see github commit history) as
" a powerline theme

" TODO: find a replacement for snipmate not from marcweber -- too heavy

" TODO: add <unique> and hasmapto to mappings in your scripts
" TODO: master undo trees (with potential visual plugin), registers, folds, macros (flash cards)
" TODO: use splits more
" TODO: use marks more
" TODO: use registers more
" TODO: use snippets more
" TODO: master completion mode (for eg. file completion, dictionary & others)
" TODO: general philosophy: if a shortcut is a new feature (for eg. cmd-t), take
"   liberty with changing it to whatever. if it's a built in vim feature, only
"   change it if it's a pain in the arse.
" TODO: try to edit files remotely from within macvim using ssh
" TODO: add a bundle to rename a buffer and file on the filesystem (see https://github.com/jbe/.vim/blob/master/functions.vim)
" TODO: read the full tags manual
" TODO: add compilers for ftplugins instead of various hacks

"In order to make custom mappings easier and prevent overwritting existing
"ones, delimitMate uses the |<Plug>| + |hasmapto()| (|usr_41.txt|) construct
"for its mappings.
"
" also conisder vimgrep vs grep vs ack. and add an optional word input
" variant.

" TODO: set up visual mappings as well as normal ones for your plugins

" TODO: map to important things: leader space, leader tab, \\, H, L, and M

" TODO: figure out if any ftplugins use this localleader (help :maplocalleader)

" TODO: work more with the spelling correction engine (:help dictionary)

" TODO: report the omnicomplete glitch on the vim mailing list. steps to
" reproduce:
" 1. open a new window
" 2. set ft=python omnifunc=pythoncomplete#Complete splitright
" 4. vsplit anewsplit
" 5. <c-w><c-h>
" 6. i (to go into insert mode)
" 7. type: list.<c-x><c-o>
" 8. observe the completion options overlapping the omnicomplete description buffer (you may have to make your window shorter)
"
" the items should not overlap. this glitch doesn't occur in the right split,
" which you can observe).
