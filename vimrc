" mbadran's vimrc <github.com/mbadran/dotvim>

" powerline {{{1
" set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

" bundles: boilerplate {{{1
set runtimepath+=$HOME/.vim/bundle/vundle/
try
  call vundle#rc()

  " bundles: github {{{1

  Bundle 'Lokaltog/vim-powerline'
  Bundle 'Shougo/neocomplcache'
  Bundle 'Valloric/MatchTagAlways'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'avakhov/vim-yaml'
  Bundle 'chreekat/vim-paren-crosshairs'
  Bundle 'csexton/trailertrash.vim'
  Bundle 'fs111/pydoc.vim'
  Bundle 'gmarik/sudo-gui.vim'
  " let vundle manage vundle
  Bundle 'gmarik/vundle'
  Bundle 'kana/vim-smartinput'
  Bundle 'kien/ctrlp.vim'
  Bundle 'majutsushi/tagbar'
  Bundle 'mattn/ctrlp-register'
  Bundle 'mbadran/headlights'
  Bundle 'myusuf3/numbers.vim'
  Bundle 'nanotech/jellybeans.vim'
  Bundle 'nelstrom/vim-markdown-folding'
  Bundle 'rkitover/vimpager'
  Bundle 'scrooloose/nerdtree'
  Bundle 'scrooloose/syntastic'
  Bundle 'sickill/vim-pasta'
  Bundle 'sjl/gundo.vim'
  Bundle 'sontek/rope-vim'
  Bundle 'skammer/vim-css-color'
  Bundle 'sukima/xmledit'
  Bundle 'thinca/vim-quickrun'
  Bundle 'tomtom/tcomment_vim'
  Bundle 'tomtom/quickfixsigns_vim'
  " required by quickfixsigns
  Bundle 'tomtom/tlib_vim'
  Bundle 'tpope/vim-endwise'
  Bundle 'tpope/vim-eunuch'
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-markdown'
  Bundle 'tpope/vim-repeat'
  Bundle 'tpope/vim-scriptease'
  Bundle 'tpope/vim-sensible'
  Bundle 'tpope/vim-surround'
  Bundle 'tpope/vim-unimpaired'
  Bundle 'wikitopian/hardmode'
  Bundle 'xolox/vim-easytags'

  " bundles: vim-scripts {{{1

  Bundle 'AfterColors.vim'
  Bundle 'CmdlineComplete'

catch /E117/ | endtry    " no vundle

" bundles: mine {{{1

" set runtimepath+=$HOME/.vim/mundle/headlights
" TODO: improve and release
set runtimepath+=$HOME/.vim/mundle/quicktrix
set runtimepath+=$HOME/.vim/mundle/jpythonfold.vim
" TODO: consider improving and releasing
" set runtimepath+=$HOME/.vim/mundle/vimbits
" set runtimepath+=$HOME/.vim/mundle/vimroom

" settings {{{1

let g:mapleader = ','

filetype indent plugin on

" enable syntax highlighting
syntax on

" enable case insensitive search when using lowercase letters
set ignorecase

" enable case insensitive keyword completion when ignorecase is on
set infercase

" go to the first non-blank of the line instead of the start (where possible)
set nostartofline

" ask for confirmation instead of failing commands
set confirm

" don't beep or flash
set visualbell
set t_vb=

" enable the mouse in all modes
set mouse=a

" time out quickly on mappings
set timeout
set timeoutlen=500

" allow modified buffers to be hidden
" set hidden

" highlight search matches
set hlsearch

" hide the intro message on startup
set shortmess+=I

" keep the cursor in the middle of the window
set scrolloff=999
set sidescrolloff=999

" put new :vsplits windows on the right
set splitright

" put new :split windows below
set splitbelow

" wrap long lines
set linebreak

" automatically save before certain commands
set autowriteall

" let h and l traverse lines too
set whichwrap+=h,l

" substitute all matches in a line instead of just the first (use /g flag for first match only)
set gdefault

if v:version > 702
  " show line numbers relative to the cursor position
  set relativenumber

  " change to dir of the current file automatically
  set autochdir
else
  " change to dir of the current file automatically
    lcd %:p:h
endif

" don't create swap files
set noswapfile

" enable backups
set backup

" list all matches and complete till longest common string
" (tab twice to cycle through)
set wildmode=list:longest,list:full

" specify the language for spelling corrections
set spelllang=en_au

" specify a file for good spellings
set spellfile=$HOME/.vim/spell/general.utf-8.add

" specify the dictionary files for keyword completion
set dictionary+=/usr/share/dict/words

" specify the fill characters
set fillchars=vert:\\,fold:·

" add only one space when joining sentences
set nojoinspaces

" stop cursor from blinking in normal mode
set guicursor+=n:blinkon0

" limit the number of menu items for omnicompletion (temporary hack)
set pumheight=17

" allow the cursor to go anywhere in block mode
set virtualedit+=block

" show more information while completing tags
set showfulltag

" always report number of lines changed
" setting to 1 for now -- too much noise
set report=1

" match angle brackets too
set matchpairs+=<:>

" don't make windows the same size
set noequalalways

" speed up background operations
" slow it down for easytags
set updatetime=4000

" unset these as word delimiters
set iskeyword+=$,%,#

" set these as word delimiters
set iskeyword-=_

" set grep options
" TODO: switch back to grep
set grepprg=ack\ -H\ --nocolor\ --nogroup\ --column
" set grepformat=%f:%l:%c:%m,%f:%l%c%m,%f %l%c%m
set grepformat=%f:%l:%c:%m

" use custom text for folds
set foldtext=MyFoldText()

" ignore files with these extensions when completing filenames
set suffixes+=.pdf

" ignore whitespace for diff
set diffopt+=iwhite

" make quickfix (and :sb* commands) switch to open windows and tabs
" (this breaks :sbuffer -- use :vsp and :spl instead)
set switchbuf=useopen,usetab
" make quickfix open new tabs (splits in <v7) instead of reusing the window
set switchbuf+=split,newtab

" better line wrap signs
set showbreak=↪

" don't show the mode (powerline has got this handled)
set noshowmode

" indentation {{{1

" default indentation settings
" match the current indent for new lines
set autoindent

" insert spaces instead of tabs
set expandtab

" autocmds {{{1

if has("autocmd")
  augroup vimrc
    " reset all autocmds for quick re-sourcing
    autocmd!

    " configure command line buffers
    autocmd FileType * if bufname("") ==? "[Command Line]" | setlocal nonumber norelativenumber | endif

    " automatically close the preview window
    autocmd CursorMovedI,InsertLeave * if !pumvisible() | silent! pclose | endif

    " open files at the last position
    autocmd BufReadPost * call <SID>GoToLastPosition()

    " automatically source vimrc and gvimrc upon saving
    " (allow nested autocommands)
    autocmd BufWritePost vimrc,gvimrc nested source %

    " resize splits when the window is resized
    autocmd VimResized * wincmd =

    " highlight the line the cursor is on in the current buffer
    if has("gui_running")
      autocmd BufEnter,InsertLeave * setlocal cursorline
      autocmd BufLeave,InsertEnter * setlocal nocursorline
    endif

    " enable hardmode
    autocmd VimEnter,BufNewFile,BufReadPost * silent call HardMode()

  augroup END
endif

" mappings: all {{{1

" swap mark commands
noremap ' `
noremap ` '

" swap the default movements on wrapped lines
" side effect: operator-pending movements behave differently on unwrapped lines
" use dgj and dgk instead of the handy dj and dk (annoying but consistent)
" this is bad to ingrain into muscle memory, gets confusing when using vanilla vim
noremap j gj
noremap k gk
noremap 0 g0
noremap $ g$
noremap gj j
noremap gk k
noremap g0 0
noremap g$ $

" make searches 'very magic' by default
noremap / /\v
noremap ? ?\v

" power search with the commandline window
" also, filetype workaround (no idea why autocmds don't apply to the q/ and q? windows)
noremap <silent> <leader>/ q/:setlocal filetype=vim nonumber norelativenumber<CR>i\v
noremap <silent> <leader>? q?:setlocal filetype=vim nonumber norelativenumber<CR>i\v

" mappings: normal {{{1

" toggle folds more easily
nnoremap <CR> za
nnoremap <silent> <S-CR> :silent call <SID>ToggleAllFolds()<CR>
nnoremap <silent> <C-CR> zMzv

" overload Esc to also clear search matches
nnoremap <silent> <Esc> <Esc>:nohlsearch<CR>

" simplify window movements
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" repeat the last macro quickly
nnoremap <leader>. @@

" use <Tab> for % matching and <C-p> for jumping forwards
" (because <Tab> and <C-i> are the same as far as Vim is concerned)
" nnoremap <C-p> <Tab>
" vnoremap <C-p> <Tab>

" now, we can use <Tab> to jump between matches
" nnoremap <Tab> %
" vnoremap <Tab> %

" nnoremap <BS> %

" unwindows
nnoremap <silent> <leader>ew :%s/\r//e<Bar>set fileformat=unix<CR>

" txtify
nnoremap <leader>ex :setlocal filetype=txt<CR>

" follow the symlinks so we can check in changes
nnoremap <silent> <leader>ev :execute "edit " . resolve($MYVIMRC)<CR>
nnoremap <silent> <leader>eg :execute "edit " . resolve($MYGVIMRC)<CR>

nnoremap <silent> <leader>eh :edit /etc/hosts<CR>
nnoremap <silent> <leader>et :edit $HOME/.tmux.conf<CR>
nnoremap <silent> <leader>ec :edit $HOME/.ssh/config<CR>

nnoremap <silent> <leader>es :update<Bar>source %<CR>

nnoremap <silent> <leader>c :call <SID>ToggleColorColumn()<CR>

nnoremap <silent> <leader>l :call <SID>ToggleListChars()<CR>

nnoremap <leader>h :help<Space>

" don't use ex mode, do formatting instead
nnoremap Q gqip
vnoremap Q gq

" reselect text that was just pasted
nnoremap <leader>v V`]

" don't move on matches
nnoremap * *<C-o>
nnoremap # #<C-o>

" show only the current buffer
nnoremap <silent> <leader>, :silent only<CR>

" fast make
nnoremap <silent> <leader>m :make<CR>

" enter virtual replace mode by default, handy for replacing an identical number of chars
nnoremap R gR

" TODO: map to important things: space, shift space, leader space, leader tab, leader leader

" TODO: consider using A-] (or C-|) to open in a horizontal split (i suspect i'll prefer vertical splits though)
" nnoremap <C-\> :vsplit <CR>:exec("tselect ".expand("<cword>"))<CR>
nnoremap <C-\> <C-w><C-]><C-w>L
nnoremap <A-\> <C-w><C-]>

" jump to the previous tag in the stack (opposite of C-])
" TODO: find a better mapping for this
nnoremap <A-]> :pop<CR>

" TODO: make this into a function and map it after a successful run (for eg.
" unit tests or quickrun (somehow))
" nmap HH :silent !afplay ~/.vim/tools/succ_horns01.mp3 1>&-2>&-&<CR><C-l>

" keep the cursor in place while joining lines
nnoremap J mzJ`z

" copy the current filename to the clipboard
nnoremap <leader>F let @* = expand("%:p")

" map splits
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>

" update (write) buffer
nnoremap <silent> <leader>w :update<CR>

" close buffer
nnoremap <silent> <leader>c :close<CR>

" quit buffer
nnoremap <silent> <leader>q :quit<CR>

" edit a new buffer
nnoremap <silent> <leader>n :enew<CR>

" convert buffer to a scratch file (if you don't care about saving it)
nnoremap <silent> <leader>S :setlocal buftype=nofile bufhidden=hide<CR>

" mappings: visual {{{1

" reselect after an indent action (to facilitate repeat actions)
vnoremap > >gv
vnoremap < <gv

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" mappings: command {{{1

" emacs bindings in command line mode
cnoremap <C-a> <home>
cnoremap <C-e> <end>

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

" terminal {{{1

if !has("gui_running")
  " plugins should be disabled

  " set the terminal to 256 colors
  set t_Co=256

  colorscheme jellybeans

  " don't highlight the current line
  set nocursorline

  " set the terminal's title to the filename
  set title
endif

" plugin: runtime {{{1

runtime! ftplugin/man.vim

" plugin: headlights {{{1

" let g:headlights_use_plugin_menu = 1
" let g:headlights_debug_mode = 1
let g:headlights_show_files = 1
" let g:headlights_show_load_order = 1
" let g:headlights_show_commands = 0
" let g:headlights_show_mappings = 0
let g:headlights_show_abbreviations = 1
let g:headlights_show_functions = 1
" let g:headlights_smart_menus = 0
let g:headlights_show_highlights = 1
" let g:headlights_unprefix_names = 0
" let g:headlights_run_on_startup = 1
" let g:headlights_spillover_menus = 1

" plugin: syntastic {{{1

" this needs to be set here for some reason
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
" all python syntax errors are reported as warnings, for some reason. bad.
" let g:syntastic_quiet_warnings = 1

" plugin: tagbar {{{1

" TODO: fix the &tags setting so that it points to an exuberant tags file for
" each individual file alone (see if you can reuse easytag's file). then, you can
" use tselect to narrow it down. you could also combine it by showing tagbar
" at the same time

let g:tagbar_left = 1
let g:tagbar_compact = 1
" let g:tagbar_width = 31
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"

nnoremap <silent> <leader>t :TagbarToggle<CR>

" plugin: quickfixsigns {{{1

" don't show quickfix vcsdiff signs
let g:quickfixsigns_classes = ["qfl", "loc", "marks", "breakpoints"]
" don't show quickfixsigns for special buffers like tagbar, unite, and anything starting with [
" TODO: find a way to disable signs column for scratch/preview buffers without
" also disabling it for new (unnamed) vim buffers
" let g:quickfixsigns_blacklist_buffer = '^__.*__\|.\*Scratch.\*\|.\*unite.*\|\[.*$'
" let g:quickfixsigns_blacklist_buffer = '^__.*__\|^$\|.\*unite.*\|\[.*$'
" let g:quickfixsigns_blacklist_buffer = '^__.*__\|^$\|.\*unite.*\|.*path.*\|\[.*$'
let g:quickfixsigns_blacklist_buffer = '^__.*__\|^$\|^\*unite\|^regbuf\|ControlP\|^vimtips\|\[.*$'
let g:quickfixsigns#marks#texthl = "SignColumn"
let g:quickfixsigns_icons = {}

" plugin: easytags {{{1

let g:easytags_cmd = "/usr/local/bin/ctags"

" plugin: powerline {{{1

" https://github.com/mbadran/dotvim/blob/8aff32cad3305f58f274540d6f198a4dcb19473d/vimrc
let g:Powerline_symbols = "fancy"

" move things around in the default theme
call Pl#Theme#RemoveSegment("fileencoding")
call Pl#Theme#RemoveSegment("fileformat")
call Pl#Theme#RemoveSegment("filetype")
" call Pl#Theme#RemoveSegment("fugitive\:branch")
call Pl#Theme#RemoveSegment("tagbar\:currenttag")
call Pl#Theme#InsertSegment("fileformat", "after", "syntastic\:errors")
call Pl#Theme#InsertSegment("filetype", "after", "fileformat")
" call Pl#Theme#InsertSegment("fugitive\:branch", "before", "rvm\:string")
" call Pl#Theme#InsertSegment("tagbar\:currenttag", "before", "fugitive\:branch")
" call Pl#Theme#InsertSegment("pwd", "before", "tagbar\:currenttag")
call Pl#Theme#InsertSegment("pwd", "before", "rvm\:string")
" call Pl#Theme#InsertSegment("tagbar\:currenttag", "before", "pwd")
call Pl#Theme#InsertSegment("ws_marker", "after", "lineinfo")

" plugin: solarized {{{1

let g:solarized_menu = 0

" plugin: neocomplcache {{{1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_source_disable = {"dictionary_complete": 1}

" use tab and shift-tab for completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

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
" let g:quicktrix_orientation = "bottom"
" let g:quicktrix_steal_focus = 0

nnoremap <silent> <leader>d :QTodo<CR>
" nnoremap <leader>g :QGrep<Space>
" nnoremap <leader>f :QFind<Space>
" nnoremap <leader>l :QLocate<Space>
" nnoremap <leader>H :QHelp<Space>
nnoremap <silent> <leader>g :QGrep<CR>
nnoremap <silent> <leader>f :QFind<CR>
nnoremap <silent> <leader>e :QLocate<CR>
nnoremap <silent> <leader>H :QHelp<CR>

" plugin: jpythonfold {{{1

" let g:jpythonfold_CustomFoldText = 1
let g:jpythonfold_Compact = 0

" plugin: ctrlp {{{1

let g:ctrlp_switch_buffer = "ETVH"
let g:ctrlp_max_height = 25
" only for creating new files
" let g:ctrlp_open_new_file = 't'
" open all files in new tabs
let g:ctrlp_open_multiple_files = 'tj'
" don't prompt for options when opening tabs
let g:ctrlp_arg_map = 0
" reset mru files
let g:ctrlp_mruf_max = 25
let g:ctrlp_mruf_exclude = '.*vimrc\|.*/vim/runtime/doc.*\|/private/var/.*'

" FIXME: i just want to open files in a new tab when i hit enter, why is that
" so hard?
" let g:ctrlp_prompt_mappings = {
  " \ 'AcceptSelection("t")': ['<cr>']
" \}

nnoremap <silent> <leader>T :CtrlPBufTag<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>
nnoremap <silent> <leader>k :CtrlPBookmarkDir<CR>
nnoremap <silent> <leader>u :CtrlPMRUFiles<CR>
nnoremap <silent> <leader>R :CtrlPRegister<CR>

" plugin: quickrun {{{1

let g:quickrun_config = {}
let g:quickrun_config.html = {"exec": "bcat %s", "outputter": "null"}
let g:quickrun_config.ruby = {"outputter": "error", "outputter/error/error": "quickfix", "outputter/error/success": "buffer"}
let g:quickrun_config.markdown = {"exec": "open -a /Applications/Marked.app %s", "outputter": "null"}
" let g:quickrun_config.java = {"exec" : "cd /Users/fpg/Documents/projects/nhccn/EpochTime;./build.sh", "running_mark": "Building...", "outputter": "error", "outputter/error/error": "buffer", "outputter/error/success": "message"}
" use ant to make, using a build file above this (src) one
"let b:makeprgvar='ant\ -f\ ' . expand('%:p:h") . '/../build.xml'
" let b:makeprgvar='ant\ -f\ ' . '..\build.xml'
" execute ':setlocal makeprg=' . b:makeprgvar
" execute ":setlocal makeprg=" . b:makeprgvar

" plugin: tlib {{{1

" nnoremap <silent> <leader>S :tabnew<Bar>TScratch!<CR>

" plugin: nerdtree {{{1

let g:NERDTreeWinPos = "right"
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 1

" nnoremap <silent> <leader>f :NERDTreeToggle<CR>
" nnoremap <silent> <leader>f :execute "NERDTreeToggle " . getcwd() . "<CR>"
nnoremap <silent> <leader>f :call ToggleNERDTree()<CR>
function! ToggleNERDTree() " {{{1
  if exists("g:NERDTree_opened")
    execute "NERDTreeClose"
    unlet g:NERDTree_opened
  else
    execute "NERDTree " . getcwd()
    let g:NERDTree_opened = 1
  endif
endfunction

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

function! s:ToggleListChars() " {{{1
  " optimised for solarized
  " hide tildes by default, allow toggle for special chars
  " TODO: convert this into a plugin that takes the highlight commands as input
  " and then just call it from here (or any other colorscheme 'after' scripts)
  " ,c for [list/special] characters
  if exists('w:ListChars')
    highlight NonText guifg=#002b36 ctermfg=234 guibg=#002b36 ctermbg=NONE
    highlight SpecialKey guifg=#002b36 ctermfg=234 guibg=#002b36 ctermbg=NONE
    set nolist
    unlet w:ListChars
  else
    let w:ListChars = 1
    highlight Nontext guifg=#ffffff ctermfg=red guibg=#002b36 ctermbg=NONE
    highlight SpecialKey guifg=#ffffff ctermfg=red guibg=#002b36 ctermbg=NONE
    set list
  endif
endfun

function! s:VSetSearch() " {{{1
  " Visual Mode */# from Scrooloose
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

function! MyFoldText() " {{{1
  " kiss -- don't show number of folded lines (unnecessary metadata)
  let line = getline(v:foldstart)
  " so far, handles vim and python well. TODO: keep an eye out for other languages.
  let text = substitute(line, '\v^\s*"|^def |^function!? |"?\s*\{\{\{\d|:$', '', 'g')
  return "+-- " . substitute(text, '\v^\s+|\s+$', '', 'g') . " "
endfunction

" cheatsheet {{{1

" profiling vim
" # vim --startuptime vim.log

" '. goes to previously edited line
" `. goes to previous column on previously edited line
" gi goes to previous column on previously edited line, putting you in insert
" mode.

" ctrl-w ] will open the tag/function/method in a split -- better than jumping
" back and forth, especially when you still want to see the invoking code

" <C-x><C-k> to invoke spelling dictionary

" select the just pasted text: V`]

" %s/pattern//gn number of occurrences of pattern

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

" TODO: instead of using the tlib input list, create a ctrlp location list
" plugin and invoke that alongside the quickfix or location list window

" TODO: add cheatsheet items for everything you want to improve -- marks,
" registers, etc. only way you'll learn if you have an immediate reference.
" also: sessions, movement commands (as per the grok vim post), etc
" also: c-r shortcuts in insert mode, refomratting, etc. see list in todos.

" TODO: add more omnicomplete keywords to the cheatsheet (such as c-x, c-k for
" dictionary)

" TODO: add <unique> and hasmapto to mappings in your scripts
" TODO: master undo trees (with potential visual plugin), registers, folds, macros (flash cards)
" TODO: use splits more
" TODO: use marks more
" TODO: use registers more
" TODO: use snippets more
" TODO: master completion mode (for eg. file completion, dictionary & others)
" TODO: try to edit files remotely from within macvim using ssh

" TODO: review this:
"In order to make custom mappings easier and prevent overwritting existing
"ones, delimitMate uses the |<Plug>| + |hasmapto()| (|usr_41.txt|) construct
"for its mappings.

" TODO: set up visual mappings as well as normal ones for your plugins

" TODO: work more with the spelling correction engine (:help dictionary)
