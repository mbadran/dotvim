" mbadran's vimrc <github.com/mbadran/dotvim>

" bundles: boilerplate {{{1
set runtimepath+=$HOME/.vim/bundle/vundle/
try
  call vundle#rc()

  " let vundle manage vundle
  Bundle 'gmarik/vundle'

  " bundles: github {{{1

  Bundle 'Lokaltog/vim-powerline'
  " i suspect this is slowing down vim
  " Bundle 'Raimondi/delimitMate'
  " Bundle 'Rykka/ColorV'
  Bundle 'Shougo/neocomplcache'
  Bundle 'Shougo/unite.vim'
  " required by vimshell
  Bundle 'Shougo/vimproc'
  Bundle 'Shougo/vimshell'
  Bundle 'airblade/vim-rooter'
  Bundle 'altercation/vim-colors-solarized'
  " Bundle 'bkad/CamelCaseMotion'
  Bundle 'csexton/trailertrash.vim'
  Bundle 'davidoc/taskpaper.vim'
  Bundle 'ervandew/supertab'
  Bundle 'garbas/vim-snipmate'
  Bundle 'gmarik/sudo-gui.vim'
  Bundle 'gregsexton/MatchTag'
  Bundle 'h1mesuke/unite-outline'
  Bundle 'hobbestigrou/vimtips-fortune'
  " Bundle 'hallison/vim-markdown'
  Bundle 'ivanov/vim-ipython'
  " Bundle 'jystic/browser.vim'
  Bundle 'kana/vim-smartinput'
  Bundle 'kana/vim-textobj-user'
  Bundle 'kana/vim-textobj-fold'
  Bundle 'kana/vim-textobj-lastpat'
  " Bundle 'kana/vim-textobj-function'
  Bundle 'klen/python-mode'
  " required by snipmate
  Bundle 'MarcWeber/vim-addon-mw-utils'
  Bundle 'majutsushi/tagbar'
  Bundle 'michaeljsmith/vim-indent-object'
  " Bundle 'mikewest/vimroom'
  " the mapping clashes with endwise -- reconsider
  " Bundle 'Osse/double-tap'
  " Bundle 'roman/golden-ratio'
  Bundle 'scrooloose/syntastic'
  Bundle 'shemerey/vim-peepopen'
  Bundle 'sickill/vim-pasta'
  " TODO: evaluate
  " Bundle 'sjl/clam.vim'
  Bundle 'sjl/gundo.vim'
  " i suspect this is slowing down vim
  " Bundle 'skammer/vim-css-color'
  Bundle 'sukima/xmledit'
  Bundle 'tomtom/quickfixsigns_vim'
  " required by quickfixsigns and snipmate
  Bundle 'tomtom/tlib_vim'
  " TODO: find out if this does anything other than just define commands and autoread
  " Bundle 'tony/vim-tail'
  Bundle 'tpope/vim-commentary'
  Bundle 'tpope/vim-endwise'
  " TODO: check out eunuch for dev ideas
  Bundle 'tpope/vim-eunuch'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-markdown'
  Bundle 'tpope/vim-repeat'
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-unimpaired'
  " Bundle 'tyru/regbuf.vim'
  Bundle 'xolox/vim-easytags'

  " bundles: vim-scripts {{{1

  Bundle 'AfterColors.vim'
  " Bundle 'Rename'
  " TODO: consider reincluding this, breaks the / movement in normal mode
  " Bundle 'SearchComplete'
  " TODO: remove when done debugging
  Bundle 'argtextobj.vim'
  Bundle 'closetag.vim'
  " Bundle 'sessionman.vim'

catch /E117/ | endtry    " no vundle

" bundles: mine {{{1

set runtimepath+=$HOME/.vim/mundle/headlights
" TODO: improve and release
set runtimepath+=$HOME/.vim/mundle/quicktrix
set runtimepath+=$HOME/.vim/mundle/instaruler
set runtimepath+=$HOME/.vim/mundle/jpythonfold.vim
" set runtimepath+=$HOME/.vim/mundle/vimbits
" obsolete, discard
" set runtimepath+=$HOME/.vim/mundle/findinfiles
" set runtimepath+=$HOME/.vim/mundle/snide
" set runtimepath+=$HOME/.vim/mundle/sessionfridge
" set runtimepath+=$HOME/.vim/mundle/vimroom

" settings {{{1

let g:mapleader = ','
let g:maplocalleader = '_'

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
set nohidden

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

" highlight the line the cursor is on in the current buffer
if has("autocmd")
  autocmd BufEnter,InsertLeave * setlocal cursorline
  autocmd BufLeave,InsertEnter * setlocal nocursorline
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

" substitute globally by default (use /g flag for first match only)
set gdefault

if v:version > 702
  " show line numbers relative to the cursor position
  set relativenumber

  " change to dir of the current file automatically
  set autochdir

  " allow persistent undos across sessions
  set undofile

  " save undo files far away (put the full dir path in the filename)
  " (when the system restarts, undo files will be lost, which is OK TODO: is
  " it?)
  set undodir=$TEMP//,$TMP//,$TMPDIR//,.
else
  " change to dir of the current file automatically
    lcd %:p:h
endif

" don't create swap files
set noswapfile

" save backup files far away (put the full dir path in the filename)
" // expands to full dir path, not just filename (doesn't work on windows)
" (when the system restarts, backup files will be lost, which is OK TODO: is
" it?)
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

" look for tags in the current dir first, then work up the tree
set tags=./tags;/

" show more information while completing tags
set showfulltag

" always report number of lines changed
" setting to 1 for now -- too much noise
set report=1

" retain more history items
" set history=100
set history=1000

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

" set grep options
set grepprg=ack\ -H\ --nocolor\ --nogroup\ --column
" set grepformat=%f:%l:%c:%m,%f:%l%c%m,%f %l%c%m
set grepformat=%f:%l:%c:%m

" disable modelines for security reasons
set nomodeline

" use custom text for folds
set foldtext=MyFoldText()

" ignore files with these extensions when completing filenames
" set suffixes+=.class,.exe,.o,.obj,.dat,.dll,.aux,.pdf,.gch
set suffixes+=.pdf

" ignore whitespace for diff
set diffopt+=iwhite

" make quickfix (and :sb* commands) switch to open windows and tabs
" (this breaks :sbuffer -- use :vsp and :spl instead)
set switchbuf=useopen,usetab
" make quickfix open new tabs (splits in <v7) instead of reusing the window
set switchbuf+=split,newtab

" indentation {{{1

" default indentation settings
" match the current indent for new lines
set autoindent

" insert spaces instead of tabs
set expandtab

" indent/outdent to nearest tabstops
set shiftround

" FIXME: these interfere with filetype settings, i only want them to apply to
" files with no filetype
" set tabstop=4
" set softtabstop=4
" set shiftwidth=4

" autocmds {{{1

if has('autocmd')
  augroup vimrc
    " reset all autocmds for quick re-sourcing
    autocmd!

    " configure command line buffers
    autocmd FileType * if bufname("") ==? "[Command Line]" | setlocal nonumber norelativenumber | endif

    " enable omnicompletion by default
    autocmd FileType * if empty(&omnifunc) | setlocal omnifunc=syntaxcomplete#Complete | endif

    " automatically close the preview window
    autocmd CursorMovedI,InsertLeave * if !pumvisible() | silent! pclose | endif

    " open files at the last position
    autocmd BufReadPost * call <SID>GoToLastPosition()

    " automatically source vimrc and gvimrc upon saving
    " autocmd BufWritePost vimrc,gvimrc source %|if exists("g:Powerline_loaded")|call Pl#Load()|endif
    autocmd BufWritePost vimrc,gvimrc call Reinit()
  augroup END
endif

" mappings: all {{{1

" go to end of previous Word with a single key
noremap M gE

" go to beginning and end of line more easily
nnoremap <silent> H :call <SID>GoToStartOfLine()<CR>
nnoremap <silent> L :call <SID>GoToEndOfLine()<CR>
onoremap <silent> H :call <SID>GoToStartOfLine()<CR>
onoremap <silent> L :call <SID>GoToEndOfLine()<CR>
vnoremap <silent> H :<C-u>call <SID>GoToStartOfLine(visualmode())<CR>
vnoremap <silent> L :<C-u>call <SID>GoToEndOfLine(visualmode())<CR>

" swap mark commands
noremap ' `
noremap ` '

" swap the default movements on wrapped lines
" side effect: operator-pending movements behave differently on unwrapped lines
" use dgj and dgk instead of the handy dj and dk (annoying but consistent)
noremap j gj
noremap k gk
noremap 0 g0
noremap $ g$
noremap gj j
noremap gk k
noremap g0 0
noremap g$ $

" invoke command line mode with one key
noremap <space> :
" invoke commandline window with two
noremap <leader><space> q:i

" make searches 'very magic' by default
noremap / /\v
noremap ? ?\v

" power search with the commandline window
" note: this doesn't support motions using search operators
" FIXME: find out why autocmds don't apply to the q/ window (meanwhile, work around)
noremap <silent> <leader>/ q/:setlocal filetype=vim nonumber norelativenumber<CR>i\v
noremap <silent> <leader>? q?:setlocal filetype=vim nonumber norelativenumber<CR>i\v

" mappings: normal {{{1

" make Y behave like D and C, not yy
nnoremap Y y$

" toggle folds more easily
nnoremap <CR> za
nnoremap <silent> <S-CR> :silent call <SID>ToggleAllFolds()<CR>
nnoremap <silent> <C-CR> zMzv

" overload Esc to also clear search matches
" FIXME: find out why this line starts terminal vim with the 'c' command
nnoremap <silent> <Esc> <Esc>:nohlsearch<CR>
" nnoremap <Esc> :call feedkeys("\<Esc>")<CR><Bar>:nohlsearch<CR>
" nnoremap <esc> :call feedkeys('Esp')<CR>
" nnoremap <silent> \<Esc> :q<CR>

" simplify window movements
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" make the arrow keys rotate splits (and resize them equally)
nnoremap <Left> <C-w>L<C-w>=
nnoremap <Right> <C-w>H<C-w>=
nnoremap <Up> <C-w>K<C-w>=
nnoremap <Down> <C-w>J<C-w>=

" repeat the last macro quickly
nnoremap <leader>. @@

" use <Tab> for % matching and <C-p> for jumping forwards
" (because <Tab> and <C-i> are the same as far as Vim is concerned)
" nnoremap <C-p> <Tab>
" vnoremap <C-p> <Tab>

" now, we can use <Tab> to jump between matches
" nnoremap <Tab> %
" vnoremap <Tab> %

nnoremap <BS> %

" unwindows
nnoremap <silent> <leader>vw :%s/\r//e<Bar>set fileformat=unix<CR>

nnoremap <leader>vx :setlocal filetype=txt<CR>

" follow the symlinks so we can check in changes
nnoremap <silent> <leader>vv :execute "tabedit " . resolve($MYVIMRC)<CR>
nnoremap <silent> <leader>vg :execute "tabedit " . resolve($MYGVIMRC)<CR>
nnoremap <silent> <leader>vs :update<Bar>source %<CR>
nnoremap <silent> <leader>vt :tabedit ~/Dropbox/todo/1_Life.taskpaper<CR>
nnoremap <silent> <leader>vc :call <SID>ToggleColorColumn()<CR>

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
" nnoremap <leader>R :registers<CR>
" nnoremap <leader>R :RegbufOpen<CR>

" reselect text that was just pasted
nnoremap <leader>v V`]

" don't move on matches
nnoremap * *<C-O>
nnoremap # #<C-O>

" open a quickfix window for the last search
" TODO: move this to quicktrix
" nnoremap <silent> <leader>? :execute "lvimgrep /" . @/ . "/gj %"<CR>

" show only the current buffer
nnoremap <leader>o :silent only<CR>

" fast make. that is all.
nnoremap <silent> <leader>m :make<CR>

" toggle case in Word (i don't use U to undo changes on one line)
" TODO: find other mappings for this
" TODO: improve this, make it support visual mode, etc
" nnoremap U g~iW
" toggle case till End (for sentence case)
" nnoremap ,U g~E

" TODO: consider making this U
" nnoremap R <C-r>

" enter virtual replace mode by default
" handy when you want to replace an identical number of chars
" TODO: use this more often
nnoremap R gR

" easy redo (i never use U to replace)
nnoremap U <C-r>

nnoremap _ 0D

" also map the following:
" + and - for space.vim
" TODO: map to important things: Z, leader tab,
" TODO: consider using the Z key for my quicktrix plugin mappings instead of ,<key> then something. actually, do that!

" TODO: consider using A-] (or C-|) to open in a horizontal split (i suspect i'll prefer vertical splits though)
" nnoremap <C-\> :vsplit <CR>:exec("tselect ".expand("<cword>"))<CR>
nnoremap <C-\> <C-w><C-]><C-w>L
nnoremap <A-\> <C-w><C-]>

nnoremap + <C-w>+
nnoremap - <C-w>-

" mappings: visual {{{1

" reselect after an indent action (to facilitate repeat actions)
vnoremap > >gv
vnoremap < <gv

" mappings: command {{{1

" do a sudo write
" cnoremap w!! w !sudo tee % > /dev/null
cnoremap w!! silent SudoWriteMacGUI

" fix searches
cnoremap %s/ %s/\v
cnoremap %g/ %g/\v

cnoremap <expr> ;;p expand("%:p:h") . "/"

" mappings: insert {{{1

" calculate expression
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" mappings: operator-pending {{{1

" abbreviations {{{1

" silence grep, let the quickfix window show results
cabbrev grep silent grep

" commands {{{1

command! DiffOrig vertical new | set buftype=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" TODO: pull these into a separate plugin


" textobject: fold {{{1

" vnoremap af :<C-U>silent! normal! [zV]z<CR>
" onoremap af :normal! Vaf<CR>

" TODO: reconsider these (y u no use?) also, some clash with text-object plugins
" textobject: square {{{1

" vnoremap iq i[
" vnoremap aq a[
" onoremap iq i[
" onoremap aq a[

" textobject: curly {{{1

" vnoremap ic i{
" vnoremap ac a{
" onoremap ic i{
" onoremap ac a{

" textobject: angle {{{1

" vnoremap ia i<
" vnoremap aa a<
" onoremap ia i<
" onoremap aa a<

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
endif

" plugin: runtime {{{1

runtime! macros/matchit.vim
runtime! ftplugin/man.vim

" plugin: peepopen {{{1

"disable default mapping so we can reuse it
map <nop> <Plug>PeepOpen

" plugin: headlights {{{1

" let g:headlights_use_plugin_menu = 1
" let g:headlights_debug_mode = 1
let g:headlights_show_files = 1
let g:headlights_show_load_order = 1
" let g:headlights_show_commands = 0
" let g:headlights_show_mappings = 0
let g:headlights_show_abbreviations = 1
let g:headlights_show_functions = 1
" let g:headlights_smart_menus = 0
let g:headlights_show_highlights = 1
" let g:headlights_unprefix_names = 0

" plugin: syntastic {{{1

" this needs to be set here for some reason
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
" all python syntax errors are reported as warnings, for some reason. bad.
" let g:syntastic_quiet_warnings = 1

" plugin: tagbar {{{1

let g:tagbar_left = 1
let g:tagbar_compact = 1
" let g:tagbar_width = 31
let g:tagbar_autofocus = 1
" let g:tagbar_autoclose = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"

" nnoremap <silent> <leader>T :TagbarToggle<CR>

" plugin: supertab {{{1

" do context aware completion
let g:SuperTabDefaultCompletionType = 'context'
" fall back to current/local file completion (instead of the 'complete' option)
let g:SuperTabContextDefaultCompletionType = "<c-x><c-p>"

" plugin: rooter {{{1

let g:rooter_use_lcd = 1

" disable the default mapping
map <nop> <Plug>RooterChangeToRootDirectory

" plugin: quickfixsigns {{{1

" don't show quickfix vcsdiff signs
let g:quickfixsigns_classes = ["qfl", "loc", "marks", "breakpoints"]
" don't show quickfixsigns for special buffers like tagbar, unite, and anything starting with [
" TODO: find a way to disable signs column for scratch/preview buffers without
" also disabling it for new (unnamed) vim buffers
" let g:quickfixsigns_blacklist_buffer = '^__.*__\|.\*Scratch.\*\|.\*unite.*\|\[.*$'
let g:quickfixsigns_blacklist_buffer = '^__.*__\|^$\|.\*unite.*\|\[.*$'
let g:quickfixsigns#marks#texthl = "SignColumn"
let g:quickfixsigns_icons = {}

" plugin: camelcase {{{1

" map <silent> w <Plug>CamelCaseMotion_w
" map <silent> b <Plug>CamelCaseMotion_b
" map <silent> e <Plug>CamelCaseMotion_e
" sunmap w
" sunmap b
" sunmap e

" omap <silent> iw <Plug>CamelCaseMotion_iw
" xmap <silent> iw <Plug>CamelCaseMotion_iw
" omap <silent> ib <Plug>CamelCaseMotion_ib
" xmap <silent> ib <Plug>CamelCaseMotion_ib
" omap <silent> ie <Plug>CamelCaseMotion_ie
" xmap <silent> ie <Plug>CamelCaseMotion_ie

" plugin: easytags {{{1

let g:easytags_cmd = "/usr/local/bin/ctags"

" plugin: csscolor {{{1

let g:cssColorVimDoNotMessMyUpdatetime = 1

" plugin: powerline {{{1

let g:Powerline_symbols = "fancy"
" let g:Powerline_theme = "skwp"
" let g:Powerline_colorscheme = "skwp"

" plugin: solarized {{{1

let g:solarized_menu = 0
" let g:solarized_hitrail = 1

" plugin: neocomplcache {{{1
" FIXME: troubleshoot why this is so slow
" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_source_disable = {"dictionary_complete.vim": 1}

" plugin: python-mode {{{1
let g:pymode_folding = 0
" let the run key correspond to the 'make' mapping
let g:pymode_run_key = "<leader>m"
" FIXME: disable this for now, autocomplete hangs vim
" let g:pymode_rope_vim_completion = 0

" plugin: unite {{{1
let g:unite_split_rule = "aboveleft"
let g:unite_source_grep_command = "ack"
let g:unite_source_grep_default_opts = "-H --nocolor --nogroup --column"
let g:unite_source_grep_recursive_opt = ""

" TODO: do this properly
nnoremap <silent> <leader>T :Unite -toggle -vertical -hide-source-names -buffer-name=Tags -quick-match output:!/usr/local/bin/ctags\ -x\ %\ \|\ grep\ "function"\ \|\ cut\ -d\ "\ "\ -f\ 1<CR>

nnoremap <silent> <leader>O :Unite -toggle -vertical -direction=aboveleft -hide-source-names -no-empty -buffer-name=Outline -auto-preview -quick-match outline<CR>

" nnoremap <silent> <leader>r :Unite -toggle -vertical -hide-source-names -quick-match register<CR>
nnoremap <silent> <leader>R :Unite -toggle -vertical -hide-source-names -buffer-name=Registers -quick-match register<CR>

" TODO: add L for locate

" TODO: write a source to search vim menus (and narrow by Bundles) -- just an experiment

nnoremap <silent> <leader>G :Unite -toggle -hide-source-names -buffer-name=Grep grep:*<CR>

nnoremap <silent> <leader>F :Unite -toggle -hide-source-names -buffer-name=Find find:.<CR>

nnoremap <silent> <leader>U :Unite -toggle -hide-source-names -buffer-name=Disk output:!du\ -\m\ \|\ sort\ -rn<CR>

nnoremap <silent> <leader>D :Unite -toggle -hide-source-names -buffer-name=TODO grep:%:-i:todo\|fixme\|maybe<CR>

nnoremap <silent> <leader>B :Unite -toggle -vertical -hide-source-names -buffer-name=Bookmarks -quick-match bookmarks<CR>

nnoremap <silent> <leader>C :Unite -toggle -vertical -hide-source-names -buffer-name=Command -quick-match output<CR>

nnoremap <silent> <leader>S :Unite -toggle -vertical -hide-source-names -buffer-name=Session -quick-match session<CR>

nnoremap <silent> <leader>E :Unite -toggle -vertical -hide-source-names -buffer-name=Explorer -quick-match file<CR>

nnoremap <silent> <leader>M :Unite -toggle -vertical -hide-source-names -buffer-name=MRU -quick-match file_mru directory_mru<CR>

" plugin: fugitive {{{1
nnoremap <leader>gg :Git<space>
nnoremap <silent> <leader>gc :Gcommit %<CR>
nnoremap <silent> <leader>gC :Gcommit<CR>
nnoremap <silent> <leader>gp :Git push<bar>silent only<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gD :silent only<bar>:diffoff<CR>
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>

" plugin: quicktrix {{{1
" let g:quicktrix_ctags_cmd = "/usr/local/bin/ctags"
let g:quicktrix_tags_sort = 0
let g:quicktrix_tags_categorise = 0
" let g:quicktrix_orientation = "bottom"
" let g:quicktrix_steal_focus = 0

nnoremap <silent> <leader>t :QTags<CR>
nnoremap <silent> <leader>d :QTodo<CR>
nnoremap <silent> <leader>H :QHelp<CR>

" plugin: jpythonfold {{{1

" let g:jpythonfold_CustomFoldText = 1
" let g:jpythonfold_Compact = 0

function! s:GoToLastPosition() " {{{1
  if line("'\"") > 0 && line("'\"") <= line("$")
    execute "normal! g`\""
  endif
endfunction

function! s:ToggleAllFolds() " {{{1
  if !&foldlevel
    setlocal foldlevel=99
  else
    setlocal foldlevel=0
  endif
endfunction

" TODO: make these a new textobject plugin
function! s:GoToStartOfLine(...) " {{{1
  if exists("a:1") && a:1 ==? "v"
    normal! `>v`<
  elseif exists("a:1") && a:1 ==? ""
    normal! `>`<
  endif

  let l:first_col = col(".")

  if getline(".") =~ "^ "
    normal! _
  else
    normal! 0
  endif

  " if we haven't moved, and we're not at the start, go to 0
  let l:current_col = col(".")
  if l:current_col != 1 && l:first_col == l:current_col
    normal! 0
  endif
endfunction

function! s:GoToEndOfLine(...) " {{{1
  if exists("a:1") && a:1 ==? "v"
    normal! `<v`>
  elseif exists("a:1") && a:1 ==? ""
    normal! `<`>
  endif

  let l:first_col = col(".")

  if getline(".") =~ " $"
    normal! g_
  else
    normal! $
  endif

  " if we haven't moved, and we're not at the end, go to $
  let l:current_col = col(".")
  if l:current_col < len(getline(".")) && l:first_col == l:current_col
    normal! $
  endif
endfunction

function! s:ToggleColorColumn() " {{{1
  " disable, if set. otherwise, show colorcolumn at 'textwidth', or at 81 chars by default
  if &colorcolumn
    let &l:colorcolumn = ""
  else
    if &textwidth
      let &l:colorcolumn = &textwidth + 1
    else
      let &l:colorcolumn = 81
    endif
  endif
endfunction

function! s:IsSpecialBuffer() " {{{1
  if &filetype ==? "tagbar" || &filetype ==? "nerdtree" || &filetype ==? "help" || &filetype ==? "qf" || &filetype ==? "man" || &filetype ==? "gitcommit" || &filetype ==? "preview" || &filetype ==? "unite" || bufname("") ==? "[Command Line]" || &buftype ==? "nofile"
    return 1
  endif
  return 0
endfunction

function! MyFoldText() " {{{1
  " kiss -- don't show number of folded lines (unnecessary metadata)
  let line = getline(v:foldstart)
  " so far, handles vim and python well. TODO: keep an eye out for other languages.
  let text = substitute(line, '\v^\s*"|^def |^function!? |"?\s*\{\{\{\d|:$', '', 'g')
  return "+-- " . substitute(text, '\v^\s+|\s+$', '', 'g') . " "
endfunction

function! Reinit() " {{{1
  execute "source " . $MYVIMRC
  source ~/.gvimrc
  source $HOME/.vim/after/colors/solarized.vim
  if exists("g:Powerline_loaded")
    call Pl#Load()
  endif
endfunction

" cheatsheet {{{1

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

" learn more about the :g command -- for example, to do actions or run script
" snippets on specific lines, the same way you used to with beanshell. see
" also the tip about using the /norm ex command with :g to run normal mode
" commands on specific lines (for eg. :g/^\d/norm A; -- this appends a
" semicolon to lines starting with numbers.) the great thing is that this
" works with any ex command, so you can run sophisticated commands on lines

" to paste the value of a variable/expression in insert mode, do the
" following: <C-r>=&tags -- this saves you having to type values manually, and
" is very handy, especially when you consider that you can put local settings
" (&l:), any global vars (with completion!), any custom expressions, maths --
" whatever.

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

" TODO: add cheatsheet items for everything you want to improve -- marks,
" registers, etc. only way you'll learn if you have an immediate reference.
" also: sessions, movement commands (as per the grok vim post), etc
" also: c-r shortcuts in insert mode, refomratting, etc. see list in todos.

" TODO: add more omnicomplete keywords to the cheatsheet (such as c-x, c-k for
" dictionary)

" TODO: review your bundles, see which ones to develop and which ones to drop,
" and which ones to replace

" TODO: review the bundles you've installed

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

" TODO: review this:
"In order to make custom mappings easier and prevent overwritting existing
"ones, delimitMate uses the |<Plug>| + |hasmapto()| (|usr_41.txt|) construct
"for its mappings.

" TODO: set up visual mappings as well as normal ones for your plugins

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
