" mbadran's vimrc <github.com/mbadran/dotvim>

" bundles: vundle {{{1

set runtimepath+=$HOME/.vim/bundle/vundle/
try
  call vundle#rc()

  " let vundle manage vundle
  Bundle 'gmarik/vundle'

  " bundles: vim-scripts {{{1

  Bundle 'Conque-Shell'
  Bundle 'matrix.vim--Yang'
  Bundle 'pydoc.vim'
  Bundle 'The-NERD-tree'
  Bundle 'fugitive.vim'
  Bundle 'Color-Sampler-Pack'
  Bundle 'SearchComplete'
  Bundle 'SuperTab-continued.'
  Bundle 'xmledit'
  Bundle 'delimitMate.vim'
  Bundle 'Solarized'
  Bundle 'Gundo'
  Bundle 'Syntastic'
  Bundle 'taskpaper.vim'
  Bundle 'Markdown'
  Bundle 'quickfixsigns'
  Bundle 'Tagbar'
  Bundle 'ack.vim'
  Bundle 'camelcasemotion'
  Bundle 'surround.vim'
  Bundle 'repeat.vim'
  Bundle 'easytags.vim'
  Bundle 'capslock.vim'
  Bundle 'unimpaired.vim'
  Bundle 'endwise.vim'
  Bundle '256-grayvim'
  Bundle 'Gist.vim'
  Bundle 'utl.vim'
  Bundle 'Pydiction'
  Bundle 'pep8--Driessen'
  Bundle 'VimClojure'
  Bundle 'growlnotify.vim'
  " TODO: figure out whether to keep this or regbuf
  Bundle 'regbuf.vim'
  " Bundle 'tregisters'
  " TODO: figure out whether to keep this or tpope's commentary
  Bundle 'tComment'
  Bundle 'closetag.vim'
  "Bundle 'Python-2.x-Standard-Library-Reference'
  "Bundle 'python.vim'
  "Bundle 'python_match.vim'
  "Bundle 'py_jump.vim'
  "Bundle 'gitignore'
  "Bundle 'netrw.vim'
  "Bundle 'The-NERD-Commenter'

  " bundles: github {{{1

  Bundle 'shemerey/vim-peepopen'
  Bundle 'klen/rope-vim'
  Bundle 'airblade/vim-rooter'
  Bundle 'sessionman.vim'
  Bundle 'renamer.vim'
  Bundle 'tarmack/vim-python-ftplugin'
  Bundle 'skammer/vim-css-color'
  "Bundle 'tpope/vim-commentary'
  "Bundle 'c9s/growlnotify.vim'

  " bundles: snipmate {{{2

  Bundle 'MarcWeber/vim-addon-mw-utils'
  Bundle 'tomtom/tlib_vim'
  Bundle 'honza/snipmate-snippets'
  Bundle 'garbas/vim-snipmate'

  "}}}
catch /E117/ | endtry    " no vundle

" bundles: mine {{{1

set runtimepath+=$HOME/.vim/mundle/headlights
set runtimepath+=$HOME/.vim/mundle/vimroom
set runtimepath+=$HOME/.vim/mundle/instaruler
set runtimepath+=$HOME/.vim/mundle/findinfiles
set runtimepath+=$HOME/.vim/mundle/snide
set runtimepath+=$HOME/.vim/mundle/sessionfridge
set runtimepath+=$HOME/.vim/mundle/spacedebris
set runtimepath+=$HOME/.vim/mundle/jpythonfold.vim

" settings {{{1

let g:mapleader = ','

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

" set a more useful statusline
set statusline=%{SetStatusline()}

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

" highlight the line the cursor is on
set cursorline

" use these file formats when reading and creating files
set fileformats=unix,dos,mac

" wrap long lines
set linebreak

" update open files when they're changed externally
set autoread

" automatically save before certain commands
set autowrite

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

" save swap files far away (put the full dir path in the filename)
" // expands to full dir path, not just filename (doesn't work on windows)
set directory=$TEMP//,$TMP//,$TMPDIR//,.

" don't create ~ backup files
set nowritebackup
"set backupdir=$TEMP//,$TMP//,$TMPDIR//,.

" list all matches and complete till longest common string
" (tab twice to cycle through)
set wildmode=list:longest,list:full

" specify the symbols for unprintable chars
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:○,extends:→,precedes:←

" specify the language for spelling corrections
set spelllang=en_au

" TODO: set a mapping, or integrate into supertab
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

" only save tabs and folds when making sessions
"set sessionoptions=tabpages,folds
set sessionoptions=tabpages

" limit the number of menu items for omnicompletion (temporary hack)
set pumheight=17

" let the cursor move past the end of the line (helps with b movements)
set virtualedit=onemore

" show more information while completing tags
set showfulltag

" always report number of lines changed
" setting to 1 for now -- too much noise
set report=1

" retain more history items
set history=1000

" match angle brackets too
set matchpairs+=<:>

" don't make windows the same size
set noequalalways

" speed up background operations
set updatetime=1000

"TODO: make this a toggleable function, cos i don't care about it most of the
"time. have a configurable column width, with 78 as default.
"set colorcolumn=80
" TODO: move this to the colorscheme
"highlight colorcolumn ctermbg=grey guibg=#1c1c1c

" unset these as word delimiters
set iskeyword+=$,%,#

" set these as word delimiters
set iskeyword-=_

" set grep options
"set grepprg=grep\ -nHi $* /dev/null
"set grepprg=grep\ -nHi\ $*
"TODO: what do i use grep for again?
set grepprg=ack

" indentation {{{1

" default indentation settings
" match the current indent for new lines
set autoindent

" insert spaces instead of tabs
set expandtab

" indent/outdent to nearest tabstops
set shiftround

"set suffixes+=.class,.exe,.o,.obj,.dat,.dll,.aux,.pdf,.gch
" TODO: comment what this is for
set suffixes+=.pdf

" autocmds {{{1

if has('autocmd')
  augroup vimrc
    " reset all autocmds for quick re-sourcing
    autocmd!

    " enable omnicompletion by default
    autocmd FileType * if &omnifunc == '' | setlocal omnifunc=syntaxcomplete#Complete | endif

    " automatically close the preview window
    autocmd CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif

    autocmd BufEnter * call Rooter()

    autocmd BufReadPost * call GoToLastPosition()

    autocmd WinEnter * call SetStatusline()
    autocmd WinLeave * call SetStatuslineNC()

    " new files should be txt by default. TODO: doesn't work, fix.
    "autocmd BufNew * set filetype=txt

    " filetype: vimrc {{{1

    " automatically source vimrc and gvimrc saving
    autocmd BufWritePost vimrc,gvimrc source %

    " filetype: txt {{{1

    " define txt extensions
    autocmd BufRead README,INSTALL,*.txt set filetype=txt

    " filetype: quickfix/location {{{1

    " (misbehaving as an ftplugin)
    "autocmd FileType qf setlocal number
    "autocmd FileType qf setlocal number statusline=\ %{GetQuickFixTitle()}%=%t%40L\ Matches\ 
    autocmd FileType qf setlocal number statusline=\ %{GetQuickFixTitle()}%=%t%40(%l\ of\ %L%)\ 
    "autocmd FileType qf setlocal statusline=\ %{GetQuickFixTitle()}%=%t%40(%)
    autocmd FileType qf let b:noquickfixsigns = 1 | call QuickfixsignsUpdate()
    " reset fold open mappings TODO: find a better way to set them so this isn't necessary
    autocmd FileType qf noremap <buffer> <CR> <CR>
    autocmd FileType qf noremap <buffer> <S-CR> <S-CR>

    " filetype: man {{{1

    " (misbehaving as an ftplugin)
    "autocmd FileType man setlocal statusline=\ %{GetDocTitle('Man')}%=[Man]\ %{expand('%:r')}%40P\ 
    autocmd FileType man setlocal nonumber norelativenumber statusline=\ %{GetDocTitle('Man')}%=[Man]\ %{expand('%:r')}%40(%)
    autocmd FileType man let b:noquickfixsigns = 1 | call QuickfixsignsUpdate()

    " filetype: commandline {{{1

    "autocmd FileType * if bufname('') == '[Command Line]' | setlocal statusline=%=%{bufname('')}%40P\  | endif
    autocmd FileType * if bufname('') == '[Command Line]' | setlocal number statusline=%=%{bufname('')}%40(%) | endif
    autocmd FileType * if bufname('') == '[Command Line]' | let b:noquickfixsigns = 1 | endif
  augroup END
endif

" mappings: all {{{1

" go to end of previous word with a single key
noremap M ge

" go to beginning and end of line more easily (see associated text-objects)
"noremap H 0
"noremap L $
noremap <silent> H :call GoToStartOfLine()<CR>
noremap <silent> L :call GoToEndOfLine()<CR>

" toggle folds more easily
" TODO: make these noremap instead?
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
nnoremap <Space> :

" unwindows
nnoremap <silent> <leader>vw :%s/\r//e<Bar>set fileformat=unix<CR>

" TODO: map to important things: leader space, leader leader, leader tab, \\, H, L, and M

" follow the symlinks so we can check in changes
nnoremap <silent> <leader>vv :execute "tabedit " . resolve($MYVIMRC)<CR>
nnoremap <silent> <leader>vg :execute "tabedit " . resolve($MYGVIMRC)<CR>
nnoremap <silent> <leader>vs :update<Bar>source %<CR>

nnoremap <silent> <leader>b :buffers<CR>

"nnoremap <leader>h :tab help<Space>
nnoremap <leader>h :help<Space>
"nnoremap <leader>H :tab helpgrep<Space>
nnoremap <leader>H :call GrepHelp()<CR>

" for when i'm done with a combination of splits in a tab
"nnoremap <leader>d :tabclose<CR>
"nnoremap <leader><D-d> :tabclose<CR>

" don't use ex mode, do formatting instead
nnoremap Q gqip
vnoremap Q gq

nnoremap <silent> <leader>l :call ToggleListChars()<CR>

" git and gist mappings
" TODO: improve mappings including gist
nnoremap <silent> <leader>gc :Gcommit %<CR>
nnoremap <silent> <leader>gC :Gcommit<CR>
" TODO: only do this if diff is set (write a function)
"nnoremap <silent> <leader>gp :Git push<Bar>wincmd h<Bar>quit<Bar>silent TagbarOpen<CR>
" TODO: this too
nnoremap <silent> <leader>gp :Git push<Bar>silent only<Bar>silent TagbarOpen<CR>
nnoremap <leader>gi :Git<Space>
nnoremap <silent> <leader>gl :Glog<CR>
"nnoremap <silent> <leader>gd :silent only<Bar>Gdiff<CR>
"nnoremap <silent> <leader>gD :wincmd h<Bar>quit<Bar>silent TagbarOpen<CR>
nnoremap <silent> <leader>gd :call DoGitDiff()<CR>
nnoremap <silent> <leader>gD :call DoGitNoDiff()<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
"nnoremap <leader>gt :Gist
"nnoremap <leader>gp :Gist -p

" toggle between paste and nopaste modes (i don't use this ATM)
nnoremap <leader>P :setlocal invpaste paste?<CR>

" toggle wrap
nnoremap <leader>W :setlocal invwrap wrap?<CR>

" show the paste registers
nnoremap <leader>r :registers<CR>

" reselect text that was just pasted
nnoremap <leader>v V`]

" open a quickfix window for the last search TODO: move to snide
nnoremap <silent> <leader>/ :execute "vimgrep /" . @/ . "/gj %"<Bar>botright cwindow 15<CR>

" don't move on matches
nnoremap * *<C-O>
nnoremap # #<C-O>

" TODO: make a function for this, requesting the pattern and the filetype for
" the recursive search. then move this to snide.
" nnoremap <silent> <leader>, :vimgrep /pattern/gj ./**/*.filetype

" use :make for these instead
" preview markdown with bcat
"nnoremap <silent> <leader>pm :silent !redcarpet %<Bar>bcat<CR>
"nnoremap <silent> <leader>p :silent !markdown %<Bar>bcat<CR>
" preview html with bcat
"nnoremap <silent> <leader>ph :silent !bcat %<CR>

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

" TODO: set up more mappings for nerd commenter -- comment, uncomment, minimal
" comment, etc.

" mappings: insert {{{2

"inoremap <C-S-Space> <C-x><C-o>

inoremap <C-B> <C-O>yB<End>=<C-R>=<C-R>0<CR>

" mappings: operator-pending {{{1

" TODO: find out why these were broken to begin with -- the new text objects?
onoremap j j
onoremap k k

" abbreviations {{{1

" TODO: add some more!

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
    "set cursorcolumn
    set colorcolumn=81
  endif
  " the c key is pressed upon entering, from some reason TODO: fix
  "normal <Esc>
endif

" plugin: runtime {{{1

runtime! macros/matchit.vim
runtime! ftplugin/man.vim

" plugin: peepopen {{{1

"disable default mapping so we can reuse it
map <nop> <Plug>PeepOpen

" plugin: nerdcommenter {{{1

" plugin: headlights {{{1

"let g:headlights_use_plugin_menu = 1
"let g:headlights_debug_mode = 1
let g:headlights_show_files = 1
let g:headlights_show_load_order = 1
"let g:headlights_show_commands = 0
"let g:headlights_show_mappings = 0
let g:headlights_show_abbreviations = 1
let g:headlights_show_functions = 1

" plugin: syntastic {{{1

" this needs to be set here for some reason
let g:syntastic_enable_signs = 1

" plugin: supertab {{{1

"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabRetainCompletionDuration = "session"

" plugin: easytags {{{1

" TODO: change colour of tags (see highlight groups defined by easytags (ref.
" help), as well as jellybeans stuff
"let g:easytags_file = '$HOME/.vim/tags'

" plugin: hammer {{{1

" TODO: use Marked instead
"nnoremap <leader>p :Hammer<CR>

" plugin: rooter {{{1

let g:rooter_use_lcd = 1

" plugin: quickfixsigns {{{1

" don't show quickfix vcsdiff signs
let g:quickfixsigns_classes = ['qfl', 'loc', 'marks', 'breakpoints']

" plugin: camelcase " {{{1

"map <silent> L <Plug>CamelCaseMotion_w
"map <silent> H <Plug>CamelCaseMotion_h
"map <silent> w <Plug>CamelCaseMotion_w
"map <silent> b <Plug>CamelCaseMotion_b
"map <silent> e <Plug>CamelCaseMotion_e
"sunmap w
"sunmap b
"sunmap e

"omap <silent> iw <Plug>CamelCaseMotion_iw
"xmap <silent> iw <Plug>CamelCaseMotion_iw
"omap <silent> ib <Plug>CamelCaseMotion_ib
"xmap <silent> ib <Plug>CamelCaseMotion_ib
"omap <silent> ie <Plug>CamelCaseMotion_ie
"xmap <silent> ie <Plug>CamelCaseMotion_ie

" plugin: easytags " {{{1

let g:easytags_cmd = '/usr/local/bin/ctags'

" only show dos and mac fileformats
function! GetFileFormat() " {{{1
  return &fileformat == 'unix' ? '' : toupper(&fileformat) . '!'
endfunction

function! GetCWD() " {{{1
  let l:cwd = substitute(getcwd(), $HOME . '\ze.*$', '~', '')
  return strlen(l:cwd) > 50 ? strpart(l:cwd, 0, 50) . '>' : l:cwd
endfunction

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

function! IsSpecialBuffer() " {{{1
  if &filetype == 'tagbar' || &filetype == 'nerdtree' || &filetype == 'help' || &filetype == 'qf' || &filetype == 'man' || &filetype == 'gitcommit' || bufname('') == '[Command Line]' 
    return 1
  endif
  return 0
endfunction

function! SetStatuslineNC() " {{{1
  if !IsSpecialBuffer()
    setlocal statusline=\ \ \ \ \ \ %f
    setlocal statusline+=%=
    setlocal statusline+=%-7w
    setlocal statusline+=\ %-50{&filetype}
  endif
endfunction

function! ToggleListChars() " {{{1
  " TODO: move this to the colorscheme script?
  if exists('w:ListChars')
    highlight NonText guifg=#151515 guibg=#151515
    highlight SpecialKey guifg=#151515 guibg=#151515
    set nolist
    unlet w:ListChars
  else
    let w:ListChars = 1
    highlight Nontext guifg=#993333 guibg=#151515
    highlight SpecialKey guifg=#993333 guibg=#151515
    set list
  endif
endfun

function! GoToLastPosition() " {{{1
" TODO: find out why this isn't working for .gvimrc
  if line("'\"") > 0 && line("'\"") <= line('$')
    execute "normal g`\""
  endif
endfunction

function! GetDocTitle(command) " {{{1
  try
    let l:title = matchstr(@:, '^' . a:command . '.*')
    return empty(l:title) ? '' : ':' . l:title
  catch /E30/
    return ''
  endtry
endfunction

function! GetQuickFixTitle() " {{{1
  return !exists('w:quickfix_title') ? '' : ':' . matchstr(w:quickfix_title, '^:\?\s*\zs.\+')
endfunction

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

function! GetNextError() " {{{1
  return !exists('g:loaded_syntastic_plugin') ? '' : SyntasticStatuslineFlag()
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

function! GoToStartOfLine()
  " save current cursor pos
  let s:save_col = getpos(".")[2]

  normal _

  let s:new_col = getpos(".")[2]

  " if we haven't moved, and we're not at the beginning, go to the beginning
  if s:save_col == s:new_col && s:new_col > 1
    normal 0
  endif
endfunction

function! GoToEndOfLine()
  " save current cursor pos
  let s:save_col = getpos(".")[2]

  normal g_

  let s:new_col = getpos(".")[2]

  " if we haven't moved, and we're not at the end, go to the end
  if s:save_col == s:new_col && s:new_col < len(getline('.'))
    normal $
  endif
endfunction

function! Rooter()
  try
    Rooter
  catch /E492/
    " rooter is not loaded (faster than having a condition just for one edge case)
  endtry
endfunction

function! DoGitDiff()
" TODO: move this into snide
  silent TagbarClose
  Gdiff
endfunction

function! DoGitNoDiff()
" TODO: move this into snide (make a toggle actually)
  " TODO: only switch windows and close them if fugitive is open (check)
  "if &diff == 1
    "wincmd h
    "quit
  "endif
  silent only
  diffoff
  silent TagbarOpen
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
"
" g<c-g> shows you doc stats, g2<c-g> shows you file stats -- file name, line number, col number, etc
" ge goes to the end of the previous word (isn't be the same or faster?
" gE goes to the end of the previous 'full' word
" if you just want to go to the end of the previous word, ge or gE is the way
" to go. otherwise, if you want to jump a few words, it's faster and easier to
" just use 'b', then 'e' or 'E' once you reach the word you want.

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

" g_ is to $ what ^ is to 0

" g`" goes to the last cursor position in the file

" gv - repeat the last selection

" g; and g, to jump around (look up using help)

" x is dl -- X is dh

" ]p to paste with indentation

" gqq reformats the current line

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

" TODO: find out why i can't get vii etc to work: http://vim.wikia.com/wiki/Indent_text_object

" TODO: add <unique> and hasmapto to mappings in your scripts
" TODO: fork the jellybeans plugin
" TODO: master undo trees (with potential visual plugin), registers,
" folds, macros (flash cards)
" TODO: use splits more
" TODO: use marks more
" TODO: use registers more
" TODO: use snippets more
" TODO: migrate your cheatsheet into flashcards
" TODO: master completion mode (for eg. file completion, dictionary & others)
" TODO: general philosophy: if a shortcut is a new feature (for eg. cmd-t), take
"   liberty with changing it to whatever. if it's a built in vim feature, only
"   change it if it's a pain in the arse.
" TODO: raise a macvim feature request for gf go in the recent document
" history natively. and ask him what recentFilesDummy macation does (search on
" mailing list first).
" TODO: use spelling completion and other completions more
" TODO: try to edit files remotely from within macvim using ssh
" TODO: add a bundle to rename a buffer and file on the filesystem (see https://github.com/jbe/.vim/blob/master/functions.vim)
" TODO: read the full quickfix manual (lots of commands)
" TODO: read the full tags manual
" TODO: add compilers for ftplugins instead of various hacks

"In order to make custom mappings easier and prevent overwritting existing
"ones, delimitMate uses the |<Plug>| + |hasmapto()| (|usr_41.txt|) construct
"for its mappings.
"
" TODO: write a snide function to pull a word under cursor and vimgrep it.
" also conisder vimgrep vs grep vs ack. and add an optional word input
" variant.

" TODO: add a hook for tpope's repeat plugin to the nerdcommenter plugin so
" that repeat works with commenting.

" TODO: find out why 2 buffers are loaded when we first start vim -- some
" annoying plugin is doing it

" TODO: consider write a quick plugin that captures the output of registers,
" then dumps it into a buffer for you to paste by navigating and hitting enter
" or typing an index. just something basic, is all.

" TODO: revise these
"nnoremap <leader>d :close<CR>
"nnoremap <leader>w :call WipeoutBuffer()<CR>

" TODO: set up visual mappings as well as normal ones for your plugins

" TODO: report the omnicomplete glitch on the vim mailing list. steps to
" reproduce:
" 1. open a new window
" 2. set ft=python omnifunc=pythoncomplete#Complete splitright
" 4. vsplit anewsplit
" 5. <c-w><c-h>
" 6. i (to go into insert mode)
" 7. type: list.<c-x><c-o>
" 8. observe the completion options overlapping the omnicomplete description buffer (you may have to make your window smaller)
"
" the items should not overlap. this glitch doesn't occur in the right split,
" which you can observe).
