" ==============================================================================
" Basic
" ==============================================================================
" {{{
set clipboard=unnamedplus            " Using system clipboard
set nocompatible                     " Not comaptible with Vi
set number relativenumber            " Line Numbers
set expandtab                        " Convert Tabs to spaces
set tabstop=4                        " Default tab for files
set softtabstop=4                    " Defualt tabs for files
set shiftwidth=4                     " Default tabs for files
set shiftround                       " indent multiples of width
set breakindent                      " Wrapped lines same indent
set breakindentopt=sbr               " Wrapping
set showbreak=↪>\                    " character to show break
set nowrap                           " Disabled by default, toggled on
set undodir=~/.vim/undodir           " Better undos
set undofile                         " Better undos
set undolevels=10000                 " Better undos
set undoreload=100000                " Better undos
set fileformat=unix                  " Unix file format by default
" set fillchars=vert:│,fold:-          " Setting divider character
" set fillchars+=stlnc:-               " Setting divider character
" set ttimeoutlen=400                " Above
" set timeoutlen=400                 " Above
" set noshowcmd                      " Keep cmd clean
" set smartindent                     " Better indentation
set noshowmode                       " Keep cmd clean
set nohlsearch                       " Enable highlight on search
set splitbelow                       " Default split positions
set splitright                       " Default split positions
set encoding=utf-8                   " Default encoding
set autoindent                       " Better indentation
set smarttab                         " Better indentation
set noswapfile                       " Swaps bad
set nobackup                         " backups bad
set scrolloff=2                      " chars between cursor & endscreen
set sidescroll=1                     " side scrolloff
set sidescrolloff=3                  " numb of cols on screen before start scroll
set wildmenu                         " Autocomplete for cmd
set wildmode=full                    " Autocomplete for cmd
set autoread                         " Auto update files changed outside of vim
set hid                              " Lets you open new files while unsaved changes
set ignorecase                       " case insensitve search
set smartcase                        " Unless you use uppercase
set showmatch                        " Show matching brackets
set mat=0                            " Blinking
set magic                            " Regex Magic
set noerrorbells                     " No bells
set novisualbell                     " No visual bells
set t_vb=                            " No sounds
set cmdheight=1                      " CMD Height
set nottimeout                       " cmd's dont timeout
set notimeout                        " cmd's dont timeout
set cursorline                       " Column where line is
set ttyfast                          " fast term!
set incsearch                        " Incremental Searching
set inccommand=nosplit               " Live substitutions
set nowritebackup                    " disable
set updatetime=100                   " quicker updating
set conceallevel=0                   " back to default
set modeline                         " use modelines
set backspace=indent,eol,start       " correct backspace
set ve=block                         " virtual editing
set grepprg=rg\ --vimgrep            " use ripgrep for grepping
set formatoptions-=t                 " no auto wrap
set formatoptions-=cro               " no auto commenting
set shortmess=atIAcFW                " no startup + auto comp message
set signcolumn=auto:4                " toggle show, upto 4 wide
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set lazyredraw                       " don't update screen during macro
set textwidth=100                    " 100 chars for wrapping
set spelllang=en_gb                  " the queen's english
set complete+=kspell                 " autocomplete from dictionary w/spell
runtime macros/matchit.vim           " matching if elses
set foldmethod=indent                " simple folding
let g:python3_host_prog="/home/milo/.config/nvim/neo-venv/bin/python3" " save neovim some ms
" }}}


" ==============================================================================
"  File Searching
" ==============================================================================
" {{{
set path=.                           " Default path
set path+=**                         " search subfolders
set wildignore+=**/venv/**           " Ignoring stuff in virtual environment
set wildignore+=**/.git/**           " Ignoring stuff in git
set wildignore+=*.pyc                " Ignoring cache
set wildignore+=**/__pycache__/**    " Ignoring cache
set wildignore+=*.so,*.pyc,*.png,*.jpg,*.gif,*.jpeg,*.ico,*.pdf
set wildignore+=*.wav,*.mp4,*.mp3
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
set wildignore+=_pycache_,.DS_Store,.vscode,.localized
set wildignore+=.cache,node_modules,package-lock.json,yarn.lock,dist
set wildignore+=.vimruncmd
command! MakeTags !ctags -R .
" }}}


" ==============================================================================
"  PLUGINS
" ==============================================================================
" {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" File Navigation
Plug 'junegunn/fzf',  {'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter', {'on': ['FindRootDirectory']}
    Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind', 'NERDTreeToggleVCS']}
    Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind', 'NERDTreeToggleVCS']}
Plug 'mbbill/undotree', {'on': ['UndotreeToggle']}                   " visualise undo history

" Colours
" Plug 'morhetz/gruvbox'                                               " Gruvbox theme
Plug 'sainnhe/gruvbox-material'                                      " tweaked gruvbox
    Plug 'vim-airline/vim-airline'                                       " Simple Status line
    Plug 'vim-airline/vim-airline-themes'                                " Simple Status line
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}              " highlighting of colours
    Plug 'junegunn/goyo.vim', {'on': ['Goyo']}                           " Distraction free mode
    Plug 'junegunn/limelight.vim', {'on': ['Goyo']}                      " used w goyo
    Plug 'ryanoasis/vim-devicons'

" tpope goodness
Plug 'tpope/vim-surround'                                            " wow quotes
    Plug 'tpope/vim-fugitive'                                            " git integration
Plug 'tpope/vim-repeat'                                              " let . work for (some) plugins
Plug 'tpope/vim-commentary'                                          " gcc to comment and uncomment things
    Plug 'tpope/vim-obsession'                                           " how sessions should be

" helpers
Plug 'jiangmiao/auto-pairs'                                          " auto close brackets
    Plug 'machakann/vim-highlightedyank'                                 " Highlight text that has been yanked
    Plug 'kshenoy/vim-signature'                                         " show marks in sign column
Plug 'nathanaelkane/vim-indent-guides', {'on': ['IndentGuidesToggle']}
Plug 'dstein64/vim-startuptime', {'on': ['StartupTime']}             " debug startup time
Plug 'linluk/vim-websearch'                                          " google terms
Plug 'junegunn/vim-peekaboo'                                         " see register content
" Plug 'lfv89/vim-interestingwords'                                    " tag hl words when exploring code
Plug 'dominikduda/vim_current_word'                                  " syntax aware hl word under cursor
    Plug 'airblade/vim-gitgutter', {'on': ['GitGutterToggle']}           " highlight chagnes & text obj
    Plug 'arecarn/vim-selection'                                         " dep for crunch
    Plug 'arecarn/vim-crunch'                                            " quick calcs! with g=

" Text Objects
Plug 'kana/vim-textobj-user'                                         " UD objects
Plug 'reedes/vim-textobj-sentence', {'for': ['markdown']}            " clever sentence objects
Plug 'michaeljsmith/vim-indent-object'                               " identation objects
Plug 'mattn/vim-textobj-url'                                         " url text obj
Plug 'glts/vim-textobj-comment'                                      " comments
Plug 'wellle/targets.vim'                                            " improve in-builts + more
Plug 'whatyouhide/vim-textobj-xmlattr'                               " html tags
Plug 'vimtaku/vim-textobj-keyvalue'                                  " key value pair
Plug 'kana/vim-textobj-fold'                                         " folding

" Motions & navigation
Plug 'rhysd/clever-f.vim'                                            " smart f/t movement
Plug 'chaoren/vim-wordmotion'                                        " improved/consistent word definiton
Plug 'AndrewRadev/sideways.vim'                                      " move arguments/li's around
Plug 'junegunn/vim-easy-align'                                       " horizontal alignment of words
Plug 't9md/vim-textmanip'                                            " shift text around, vertically
Plug 'easymotion/vim-easymotion'                                     " used like a better sneak

" Writing
Plug 'shime/vim-livedown', {'for': ['markdown']}                     " live preview of markdown
    Plug 'dbmrq/vim-ditto', {'on': ['ToggleDitto']}                      " DRY, but for writing
    Plug 'reedes/vim-wordy', {'on': ['Wordy']}                           " check yo profanity
    Plug 'reedes/vim-litecorrect'                                        " gentle auto correct
    Plug 'SidOfc/mkdx'                                                   " insanely customisable markdown

" Python stuff
Plug 'vim-python/python-syntax', {'for': ['python']}                 " Python syntax highlighting
Plug 'jeetsukumaran/vim-pythonsense', {'for': ['python']}            " objects for python
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']}            " better indent for python
Plug 'raimon49/requirements.txt.vim', {'for': ['requirements']}      " syntax highlight req.txt
" Plug 'chrisbra/csv.vim'                                              " nice csv viewing.
    Plug 'janko/vim-test'                                                " run tests easily

" HTML / CSS stuff
Plug 'alvan/vim-closetag', {'for': ['html']}                         " close html tags
Plug 'Valloric/MatchTagAlways', {'for': ['html']}                    " html highlight tags
Plug 'AndrewRadev/tagalong.vim', {'for': ['html']}                   " auto change tag (surround is manual)

" General Language stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}                      " code completion
" Plug 'Shougo/echodoc.vim'                                            " show function signatures
    Plug 'sheerun/vim-polyglot'                                          " for lesser used languages
Plug 'majutsushi/tagbar', {'on': ['TagbarToggle']}                   " outline of file by class/function
Plug 'kassio/neoterm', {'on': ['Ttoggle']}                           " quick toggle term + REPL
    Plug 'junegunn/rainbow_parentheses.vim', {'on': ['RainbowParentheses']} " useful 2% of the time

call plug#end()
filetype plugin indent on
" }}}


" ==============================================================================
" THEME
" ==============================================================================
" {{{
set termguicolors

let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_current_word = 'grey background'
let g:seoul256_srgb=1
let g:seoul256_background=235

set background=dark
colorscheme gruvbox-material
let g:airline_theme='gruvbox_material'
" semi-transparent pop-up window
set pumblend=10
" no transparency for selected autocomplete
hi PmenuSel blend=0

" current word stuff
let g:vim_current_word#highlight_delay=600
let g:vim_current_word#highlight_only_in_focused_window=1
let g:vim_current_word#highlight_current_word=0

" highlight yank colour
highlight! HighlightedyankRegion guibg=#f5c542 guifg=#f5c542
" }}}


" ==============================================================================
"  BINDINGS
" ==============================================================================
" {{{
" Leader remap
nnoremap <SPACE> <Nop>

let mapleader = " "
" Inserting new lines without leaving normal mode
" nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
" nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
nmap <leader>o <Plug>(textmanip-blank-below)
nmap <leader>O <Plug>(textmanip-blank-above)

" Save files when you forgot to sudo into it
cmap w!! w !sudo tee > /dev/null %
" Better saving
nmap <silent> <leader>w :w!<cr>
" Better quitting
nmap <silent> <leader>q :qall<cr>
nmap Q <Nop>

" correct y
noremap Y y$

" good visual mode  (Removed b/c of targets vim)
" nnoremap v <C-v>

" join and split lines intuitively
nnoremap <c-h> 0i<BS><esc>
nnoremap <c-l> i<cr><esc>kj$

inoremap <M-l> <Right>
inoremap <M-k> <Up>
inoremap <M-j> <Down>
inoremap <M-h> <Left>

" Better navigation
noremap <C-k> <C-u><C-u>
noremap <C-j> <C-d><C-d>
noremap J <c-d>
noremap K <c-u>
noremap H 0
noremap L $

" next and previous appearance of a word
" nnoremap <C-p> #zz
" nnoremap <C-n> *zz
" next and previous jump
nnoremap <C-p> <C-o>
nnoremap <C-n> <C-i>

" When pasting over text, don't overrwrite register
vnoremap p "_dP

" Easier indentation
noremap <Tab> >>
noremap <S-Tab> <<
vnoremap <Tab> >><esc>gv
vnoremap <S-Tab> <<<esc>gv

" Search results centered
" nnoremap <silent> n nzz
" nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" mnemoinc top & bottom
noremap gk gg
noremap gj G

" moving between brackets, 1 key stroke
nmap 0 %

" Change text without putting the text into register,
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" rebinds semi-colon to toggle full cmd window
nnoremap ; q:
au CmdwinEnter * noremap <buffer> ; :q<CR>

" switch between buffers
nnoremap <bs> <c-^>

" cmd mode abbr fixes
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev Qall qall

" unmap things mapped elsewhere
noremap >> <Nop>
noremap << <Nop>
noremap <C-u> <Nop>
noremap <C-d> <Nop>
noremap <C-f> <Nop>
noremap <C-b> <Nop>

" No Arrow keys!
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>

" Run nodejs easily
au FileType javascript nnoremap <buffer> <leader>rf :!node %<cr>

" jump to end tag in html
au FileType html nmap <silent> <buffer> ) :MtaJumpToOtherTag<CR>

" useful buffer switching
nnoremap <silent> = :bn <cr>
nnoremap <silent> - :bp <cr>
nnoremap <silent> _ :bd <cr>
" nnoremap <silent> _ :b#<bar>bd#<CR>


" {{{2 Skip the neoterm toggle buffer
" function! PrevBufferTab()
"     bprev
"     if &filetype == 'neoterm'
"         bprev
"     endif
" endfunction
" function! NextBufferTab()
"     bnext
"     if &filetype == 'neoterm'
"         bnext
"     endif
" endfunction
" " Cycle buffer tabs in airline's tab bar
" nnoremap <silent> - :call PrevBufferTab()<cr>
" nnoremap <silent> = :call NextBufferTab()<cr>
" }}}

" consistent closing of windows
nnoremap <C-w>q <C-w>c
nnoremap <C-w><C-q> <C-w>c

" prepend to all lines in block w/same indent
nmap <silent> <leader>I ^vii<C-V>I
nmap <silent> <leader>A ^vii<C-V>$A

" text movement with ALT
nnoremap <silent> <M-l> :SidewaysRight<CR>
nnoremap <silent> <M-h> :SidewaysLeft<CR>
xmap <M-j> <Plug>(textmanip-move-down)
xmap <M-k> <Plug>(textmanip-move-up)
nmap <M-j> <Plug>(textmanip-move-down)
nmap <M-k> <Plug>(textmanip-move-up)

" consistent next and prev in command mode
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>

" }}}


" ==============================================================================
" Spelling / Writing Mode
" ==============================================================================
" {{{
" ts - toggle mode
" sa - add to dict
" sc - spell correction
" sC - spell correction with a choice
" sd - Ditto, overuse of words
" sw - look at stylistic elements

set spellfile=~/.vim/spell/en.utf-8.add
let g:ditto_mode= "paragraph"
let g:ditto_min_repetitions=3
let g:ditto_min_word_length=4

nnoremap <silent> <leader>ts :call WritingMode()<CR>

au BufEnter, BufNewFile let b:writing_mode=0
function! WritingMode()
    if !exists("b:writing_mode")
        let b:writing_mode=0
    endif
    if b:writing_mode == 0
        setlocal spell
        if !&wildcharm | set wildcharm=<C-z> | endif
        execute 'nnoremap <leader>sw :Wordy<space>'.nr2char(&wildcharm)
        nnoremap <buffer> <leader>sd :ToggleDitto<CR>
        nnoremap <buffer> <leader>sa zg
        nnoremap <buffer> <leader>sc 1z=
        nnoremap <buffer> <leader>sC z=

        call litecorrect#init()
        let b:writing_mode=1
        echo("Writing Mode On")
    else
        setlocal nospell
        nnoremap <buffer> <leader>sd <Nop>
        nnoremap <buffer> <leader>sw <Nop>
        nnoremap <buffer> <leader>sa <Nop>
        nnoremap <buffer> <leader>sc <Nop>
        nnoremap <buffer> <leader>sC <Nop>
        silent! DittoOff
        silent! NoWordy
        let b:writing_mode=0
        echo("Writing Mode Off")
    endif
endfunction
" }}}


" ==============================================================================
" Find & Replace Functionality (TODO)
" ==============================================================================
" {{{
nnoremap <C-s>r :%s/
vnoremap <C-s>r :s/
" }}}


" ==============================================================================
"  Clever F settings
" ==============================================================================
" {{{
let g:clever_f_across_no_line=1
let g:clever_f_ignore_case=1
let g:clever_f_smart_case=1
let g:clver_f_fix_key_direction=1
" }}}


" ==============================================================================
" Yank Stuff
" ==============================================================================
" {{{
let g:highlightedyank_highlight_duration=2000
" }}}


" ==============================================================================
" Distraction Free Mode
" ==============================================================================
" {{{
let g:goyo_width="50%"
let g:goyo_height="70%"
let g:limelight_paragraph_span = 1

nnoremap <silent> <leader>tG :Goyo<CR>

function! s:goyo_enter()
  setlocal scrolloff=999
  Limelight
  setlocal signcolumn=no
  setlocal nocursorline
  setlocal number
  au InsertLeave,WinEnter * set nocursorline
  au InsertEnter,WinLeave * set nocursorline
  let b:coc_suggest_disable = 1
  VimCurrentWordToggle
endfunction

function! s:goyo_leave()
  setlocal scrolloff=2
  setlocal cursorline
  setlocal rnu
  setlocal signcolumn=auto:4
  Limelight!
  AirlineRefresh
  au InsertLeave,WinEnter * set cursorline
  au InsertEnter,WinLeave * set nocursorline
  let b:coc_suggest_disable = 0
  VimCurrentWordToggle
endfunction

au User GoyoEnter nested call <SID>goyo_enter()
au User GoyoLeave nested call <SID>goyo_leave()
" }}}


" ==============================================================================
" Colour Highlighting
" ==============================================================================
" {{{
let g:Hexokinase_highlighters=['virtual']
" let g:Hexokinase_ftEnabled=['css', 'html', 'javascript']
let g:Hexokinase_optInPatterns = [
            \     'full_hex',
            \     'triple_hex',
            \     'rgb',
            \     'rgba',
            \     'hsl',
            \     'hsla',
            \ ]
" }}}


" ==============================================================================
" Formatting Stuff
" ==============================================================================
" {{{
"  fa -> Alignment
"  fF -> coc.nvim format whole file
"  fI -> coc.nvim arrange imports
"  ff -> standard format file (TODO)
"  fw -> wrap text accordingly
"  fi -> indent text accordingly
"  ft -> remove trailing whitespace (file or range)
"  fb -> replace multiple blank lines with one
"  fl -> lint/fix with ale

function! RemoveTrailingWhitespace()
    for lineno in range(a:firstline, a:lastline)
        let line = getline(lineno)
        let cleanLine = substitute(line, '\(\s\| \)\+$', '', 'e')
        call setline(lineno, cleanLine)
    endfor
endfunction
command! -range RT  <line1>,<line2>call RemoveTrailingWhitespace()

nnoremap <leader>ft m`:%RT<CR>``
vnoremap <leader>ft m`:RT<CR>``
nnoremap <leader>fF :Format<CR>
nnoremap <leader>fI :OR<CR>

nnoremap <leader>fw m`ggVGgwi``
nnoremap <leader>fi m`ggVG=``
vnoremap <leader>fw gwi<esc>
vnoremap <leader>fi =<esc>
xmap <leader>fa <Plug>(EasyAlign)
xmap <leader>fA <Plug>(LiveEasyAlign)

nnoremap <leader>fb m`:silent! g/^$/,/./-j<CR>``
vnoremap <leader>fb m`:g/^$/,/./-j<CR>``

" }}}


" ==============================================================================
" UndoTree Stuff
" ==============================================================================
" {{{
nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_WindowLayout=4
let g:undotree_SplitWidth=40
let g:undotree_SetFocusWhenToggle=1
let g:undotree_ShortIndicators=1
" }}}


" ==============================================================================
" Polyglot Stuff
" ==============================================================================
" {{{
let g:polyglot_disabled=['python', 'markdown', 'vim', 'csv']
" }}}


" ==============================================================================
" In-built Terminal Configuration
" ==============================================================================
" {{{
" escape goes to normal mode and c-v esc sends to program (and don't break fzf)
tnoremap <C-s><esc> <C-\><C-n>
au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
au FileType fzf tunmap <buffer> <Esc>
au TermOpen * setfiletype dterm
highlight TermCursor ctermfg=red guifg=red

" Opening splits with terminal in all directions
" nnoremap <Space>h<CR> :leftabove  vnew<CR>:terminal<CR>i
" nnoremap <Space>l<CR> :rightbelow vnew<CR>:terminal<CR>i
" nnoremap <Space>k<CR> :leftabove  new<CR>:terminal<CR>i
" nnoremap <Space>j<CR> :rightbelow new<CR>:terminal<CR>i
nnoremap <C-Space><CR> :terminal<CR>i

" close terminal like any other buffer
au TermOpen * nnoremap <silent> _ :b#<bar>bd!#<CR>

" " edit the currently in progress command in normal mode
if exists(':terminal')
  " Readline cheatsheet:
  " ctrl-a - jump to start of line
  " ctrl-e - jump to end of line
  " ctrl-k - kill forwards to the end of line
  " ctrl-u - kill backwards to the start of line
  autocmd TermOpen * nnoremap <buffer> I I<C-a>
  autocmd TermOpen * nnoremap <buffer> A A<C-e>
  autocmd TermOpen * nnoremap <buffer> C A<C-k>
  autocmd TermOpen * nnoremap <buffer> D A<C-k><C-\><C-n>
  autocmd TermOpen * nnoremap <buffer> cc A<C-e><C-u>
  autocmd TermOpen * nnoremap <buffer> dd A<C-e><C-u><C-\><C-n>
endif
" }}}


" ==============================================================================
" neoterm Plugin
" ==============================================================================
" {{{
let g:neoterm_autoinsert=0
let g:neoterm_default_mod='botright'
let g:neoterm_size=12
let g:neoterm_repl_python='python3'
let g:neoterm_direct_open_repl=0
let g:neoterm_eof=''
let g:neoterm_autoscroll=1
nnoremap <silent> <leader>` :Ttoggle<CR>
nmap gtt <Plug>(neoterm-repl-send-line)
xmap gt <Plug>(neoterm-repl-send)
nmap gt <Plug>(neoterm-repl-send)
omap gt <Plug>(neoterm-repl-send)


" au BufCreate,BufNew FileType neoterm keepalt file neoterm
au TermOpen FileType neoterm file neoterm
" au TerminalOpen FileType neoterm file neoterm
" }}}


" ==============================================================================
" Toggle Stuff
" ==============================================================================
" {{{
" b: background
" p: paste
" n: linenumbers
" w: wrap
" l: cursorline
" c: cursorcolumn
" s: spelling
" g: guides
" G: Goyo
" |: colour column
" r: rainbow parentheses
nnoremap <leader>tb :setlocal background=<C-R>=&background == "dark" ? "light" : "dark"<CR><CR>
nnoremap <leader>tp :setlocal invpaste paste?<CR> <bar>:set paste?<CR>
nnoremap <silent> <leader>tn :exec &nu==&rnu? "setlocal nu!" : "setlocal rnu!"<CR>
nnoremap <leader>tw :setlocal wrap!<CR> <bar>:set wrap?<CR>
nnoremap <leader>tl :setlocal cursorline!<CR> <bar>:set cursorline?<CR>
nnoremap <leader>tc :setlocal cursorcolumn!<CR> <bar>:set cursorcolumn?<CR>
nnoremap <leader>tr :RainbowParentheses!!<CR>

set colorcolumn=
set cc=
fun! ToggleCC()
    if &cc == ''
        setlocal cc=80
    elseif &cc == 80
        setlocal cc=100
    else
        setlocal cc=
    endif
endfun

nnoremap <silent> <leader>t\ :call ToggleCC()<CR>
" }}}


" ==============================================================================
" Python
" ==============================================================================
" {{{
let g:is_pythonsense_suppress_object_keymaps = 1
let g:is_pythonsense_suppress_motion_keymaps = 1
let g:is_pythonsense_suppress_location_keymaps = 1
let g:python_highlight_all = 1
let test#python#runner = 'pytest'
" Run python files easily
au FileType python nnoremap <buffer> <leader>rf :!python3 %<CR>
" Run doctests
au FileType python nnoremap <buffer> <leader>rt :!pytest --doctest-modules %<CR>
" }}}


" ==============================================================================
" Ulti Snips
" ==============================================================================
" {{{
let g:ultisnips_python_style='numpy'
" }}}


" ==============================================================================
"  JavaScript Snippets
" ==============================================================================
" {{{
au FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
au FileType javascript nnoremap <buffer> <leader>jc ^iconsole.log(<esc>A);<esc>
au FileType javascript vnoremap <buffer> <leader>jc diconsole.log(<esc>p`]li);<esc>
" }}}


" ==============================================================================
" HTML Stuff
" ==============================================================================
" {{{
" treat all htmldjangofiles as html (for ftplugins)
au FileType htmldjango set filetype=html
au FileType html setlocal shiftwidth=2 softtabstop=2 expandtab

" " then add back django syntax
" syn region  djangotagmarkers start="{{" end="}}"
" syn region  djangovariablemarkers start="{%" end="%}"
" command! -nargs=+ HiLink hi def link <args>
" HiLink djangotagmarkers PreProc
" HiLink djangovariablemarkers PreProc
" delcommand HiLink
" }}}


" ==============================================================================
" scss/sass Stuff
" ==============================================================================
autocmd FileType scss set iskeyword+=-

" ==============================================================================
" Markdown Stuff
" ==============================================================================
" {{{
" let g:markdown_fenced_languages=['html', 'css', 'javascript', 'python', 'js=javascript', 'py=python']
" let g:markdown_minlines = 100
" let g:markdown_folding=1
let g:livedown_autorun = 0
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser='firefox'
au BufNewFile,BufFilePre,BufRead *.md set ft=markdown

" easy insert of Numbered list
command! -range=% -nargs=1 NL
  \ <line1>,<line2>!nl -w <args> -s '. ' | perl -pe 's/^.{<args>}..$//'
" au FileType markdown vnoremap <leader>mn :NL1<CR>

au FileType markdown setlocal formatoptions+=t
au FileType markdown setlocal shiftwidth=2
au FileType markdown setlocal softtabstop=2
au FileType markdown setlocal expandtab
au FileType markdown setlocal textwidth=80
au FileType markdown call textobj#sentence#init()


let g:mkdx#settings = {
            \ 'map': {'enable': 0},
            \ 'tokens': {
                \ 'italic' : '*',
                \ 'bold' : '**',
                \ 'strike' : '~~',
                \ },
            \ 'toc': {
                \ 'update_on_write': 1,
                \ },
                \ 'highlight': {
                \ 'enable': 1,
                \ },
            \ 'fold': {'enable': 1, 'components': ['toc', 'fence']},
            \ }

fun! s:MarkdownStuff()
    nmap <buffer><silent> <leader>mtoc <Plug>(mkdx-gen-or-upd-toc)
    nmap <buffer><silent> <leader>mi <Plug>(mkdx-mkdx-text-italic-n)
    vmap <buffer><silent> <leader>mi <Plug>(mkdx-mkdx-text-italic-v)
    nmap <buffer><silent> <leader>mb <Plug>(mkdx-mkdx-text-bold-n)
    vmap <buffer><silent> <leader>mb <Plug>(mkdx-mkdx-text-bold-v)
    nmap <buffer><silent> <leader>m` <Plug>(mkdx-mkdx-text-inline-code-n)
    vmap <buffer><silent> <leader>m` <Plug>(mkdx-mkdx-text-inline-code-v)
    nmap <buffer><silent> <leader>mtc <Plug>(mkdx-toggle-checkbox-n)
    vmap <buffer><silent> <leader>mtc <Plug>(mkdx-toggle-checkbox-v)

    vmap <leader>fT :EasyAlign*<Bar><CR>
    nnoremap <leader>mv :LivedownToggle<CR>
    nnoremap <leader>mh1 :s/^#* //ge<CR>^i#<space><esc>0
    nnoremap <leader>mh2 :s/^#* //ge<CR>^i##<space><esc>0
    nnoremap <leader>mh3 :s/^#* //ge<CR>^i###<space><esc>0
    nnoremap <leader>mh4 :s/^#* //ge<CR>^i####<space><esc>0
    nnoremap <leader>mh5 :s/^#* //ge<CR>^i#####<space><esc>0
    nnoremap <leader>mh6 :s/^#* //ge<CR>^i######<space><esc>0
    nnoremap <leader>mhc :s/^#* //ge<CR>0
    nnoremap <leader>mc 0i```<CR><CR>```<esc>kka
endfun

augroup Mkdx
    au!
    au FileType markdown call s:MarkdownStuff()
augroup END

" }}}


" ==============================================================================
" Indent Line Stuff
" ==============================================================================
" {{{
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent=90
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_default_mapping = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'fzf']
au VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3c3836
au VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3836
nnoremap <silent> <Leader>tg :IndentGuidesToggle<CR>
" }}}


" ==============================================================================
" fzf options
" ==============================================================================
" {{{
let g:fzf_colors =
            \ {'fg':      ['fg', 'Normal'],
            \  'bg':      ['bg', 'Normal'],
            \  'hl':      ['fg', 'Comment'],
            \  'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \  'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \  'hl+':     ['fg', 'Statement'],
            \  'info':    ['fg', 'PreProc'],
            \  'border':  ['fg', 'Ignore'],
            \  'prompt':  ['fg', 'Conditional'],
            \  'pointer': ['fg', 'Exception'],
            \  'marker':  ['fg', 'Keyword'],
            \  'spinner': ['fg', 'Label'],
            \  'header':  ['fg', 'Comment'] }

let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=0,0'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_preview_windows=''

function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, '&signcolumn', 'no')

    let height = float2nr(20)
    let width = float2nr(100)
    let horizontal = float2nr((&columns - width) / 2)
    let vertical = 10

    let opts = {
                \ 'relative': 'editor',
                \ 'row': vertical,
                \ 'col': horizontal,
                \ 'width': width,
                \ 'height': height,
                \ 'style': 'minimal'
                \ }
    call nvim_open_win(buf, v:true, opts)
endfunction

let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit' }
"  \ 'ctrl-t': 'tab split',


" vim rooter stuff
let g:rooter_manual_only = 1
let g:rooter_patterns = ['.git/']


nnoremap <silent> <C-f>f :call fzf#vim#files('.', {'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f>b :call fzf#vim#buffers({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f>m :call fzf#vim#marks({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f>o :call fzf#vim#history({'options': '--prompt "MRU >" --border "rounded"'})<CR>
nnoremap <silent> <C-f>h :call fzf#vim#helptags({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f>l :call fzf#vim#buffer_lines({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f>L :call fzf#vim#lines({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f>d :call fzf#run(fzf#wrap({'source': 'find ~/* -type d', 'sink': 'cd'}))<CR>
" and the hold down variant
nnoremap <silent> <C-f><C-f> :call fzf#vim#files('.', {'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f><C-b> :call fzf#vim#buffers({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f><C-m> :call fzf#vim#marks({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f><C-o> :call fzf#vim#history({'options': '--prompt "MRU >" --border "rounded"'})<CR>
nnoremap <silent> <C-f><C-h> :call fzf#vim#helptags({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f><C-l> :call fzf#vim#buffer_lines({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f><C-d> :call fzf#run(fzf#wrap({'source': 'find ~/* -type d', 'sink': 'cd'}))<CR>
" }}}


" ==============================================================================
" Airline Stuff
" ==============================================================================
" {{{
" Automatically display open buffers when only 1 tab
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#show_splits=0
let g:airline#extensions#term#enabled = 0
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#wordcount#enabled=0
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#taboo#enabled = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#ale#enabled = 1
let g:airline_detect_iminsert=0
"let g:airline#extensions#tabline#buffer_idx_mode = 1
" keeping neoterm for now
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler|fzf'
let g:airline#extensions#obsession#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty = ''

" au BufNew FileType neoterm let g:airline_disable_statusline = 1

let g:airline_filetype_overrides = {
    \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
    \ 'gundo': [ 'Gundo', '' ],
    \ 'help':  [ 'Help', '%f' ],
    \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
    \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
    \ 'startify': [ 'startify', '' ],
    \ 'vim-plug': [ 'Plugins', '' ],
    \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
    \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
    \ 'neoterm': ['neoterm', '']
    \ }

" fixes slow insert mode leaving
if ! has('gui_running')
    " set ttimeoutlen=10
    augroup FastEscape
        au!
        au InsertEnter * set timeoutlen=0
        au InsertEnter * set timeout
        au InsertLeave * set timeoutlen=1000
        au InsertLeave * set notimeout
    augroup END
endif
" }}}


" ==============================================================================
" Text Object mappings
" ==============================================================================
" {{{
" if/af - functions, aC/iC - class, ai/ii - indent, au/iu - urls, ac/ic - comments, ah/ih - git changes, ax/ix tag arugments, ak/iv - key value, iz, az - fold
omap aC <Plug>(PythonsenseOuterClassTextObject)
omap iC <Plug>(PythonsenseInnerClassTextObject)
omap af <Plug>(PythonsenseOuterFunctionTextObject)
omap if <Plug>(PythonsenseInnerFunctionTextObject)

vmap aC <Plug>(PythonsenseOuterClassTextObject)
vmap iC <Plug>(PythonsenseInnerClassTextObject)
vmap af <Plug>(PythonsenseOuterFunctionTextObject)
vmap if <Plug>(PythonsenseInnerFunctionTextObject)

" Arguments w/ sideways (replaced by targets)
" omap <silent> aa <Plug>SidewaysArgumentTextobjA
" xmap <silent> aa <Plug>SidewaysArgumentTextobjA
" omap <silent> ia <Plug>SidewaysArgumentTextobjI
" xmap <silent> ia <Plug>SidewaysArgumentTextobjI

" Git changes
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

"line text objects
xnoremap il g_o^
onoremap il :<C-u>normal vil<CR>
xnoremap al $o0
onoremap al :<C-u>normal val<CR>

" entire document
xnoremap ad <esc>vggoVG
onoremap ad :<C-u>normal vad<CR>

xmap ir i[
xmap ar a[
omap ir :normal vi[<CR>
omap ar :normal va[<CR>

" Lots of delimiters replaced by targets vim.
" for char in [ '_', '.', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '-', '#' ]
"     execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
"     execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
"     execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
"     execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
" endfor

" remapping vim-surround to follow the "g" verb convention
nmap gs ys
vmap gs S


" Code block (triple back-tick) object with <Shift-`>
xnoremap <silent> i¬ g_?^\s*```<cr>jo/^\s*```<cr>kV:<c-u>nohl<cr>gv
xnoremap <silent> a¬ g_?^\s*```<cr>o/^\s*```<cr>V:<c-u>nohl<cr>gv
onoremap <silent> i¬ :<C-U>execute "normal vi~"<cr>
onoremap <silent> a¬ :<C-U>execute "normal va~"<cr>

" limit targets to the current line only
" unintended consequences so removed
" let g:targets_seekRanges = 'cc cr cb cB lc lr rr ll lb lB rb rB'

" After TODO
" autocmd VimEnter * call after_object#enable('=', ':')
" }}}


" ==============================================================================
" Signature Stuff (Marks)
" ==============================================================================
" {{{
let g:SignatureEnabledAtStartup=0
nnoremap <leader>tm :SignatureToggleSigns<CR>
let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "mm",
            \ 'ToggleMarkAtLine'   :  "",
            \ 'PurgeMarksAtLine'   :  "",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarkers'       :  "",
            \ 'PurgeMarks'         :  "m<BS>",
            \ 'GotoNextLineAlpha'  :  "",
            \ 'GotoPrevLineAlpha'  :  "",
            \ 'GotoNextSpotAlpha'  :  "",
            \ 'GotoPrevSpotAlpha'  :  "",
            \ 'GotoNextLineByPos'  :  "",
            \ 'GotoPrevLineByPos'  :  "",
            \ 'GotoNextSpotByPos'  :  "",
            \ 'GotoPrevSpotByPos'  :  "",
            \ 'GotoNextMarker'     :  "",
            \ 'GotoPrevMarker'     :  "",
            \ 'GotoNextMarkerAny'  :  "",
            \ 'GotoPrevMarkerAny'  :  "",
            \ 'ListBufferMarks'    :  "",
            \ 'ListBufferMarkers'  :  ""
            \ }
" }}}


" ==============================================================================
" NERDTree Stuff
" ==============================================================================
" {{{
let g:NERDTreeMinimalUI=1 " nerd tree hiding help button
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=35
let g:NERDTreeHijackNetrw=1
let g:NERDTreeRespectWildIgnore=0
let g:NERDTreeMinimalMenu=0
let g:NERDTreeDirArrows=1
let g:NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '__pycache__', '__pycache__','.git', '.ipynb_checkpoints', '.DS_Store', '.localized', 'venv', '.mypy_cache', 'node_modules']
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowLineNumbers=1
" sort based on file extension, roughly...
let g:NERDTreeSortOrder = map(range(0, 25), '"\\." . nr2char(char2nr("a") + v:val) . "[^.]*$"')
" let NERDTreeSortOrder=['\/$', '*']
let g:webdevicons_conceal_nerdtree_brackets=1
let g:NERDTreeHighlightCursorline = 0
" remove conflict with signature vim using default 'm'
let g:NERDTreeMapMenu='`'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "S",
    \ "Untracked" : "U",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : "I",
    \ "Unknown"   : "?"
    \ }

nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>ng :NERDTreeToggleVCS<CR>
nnoremap <silent> <leader>nn :NERDTree<CR>
" }}}


" ==============================================================================
" Auto Complete Stuff
" ==============================================================================
" {{{
let g:coc_global_extensions = ['coc-python', 'coc-html', 'coc-css', 'coc-json', 'coc-tsserver', 'coc-angular']

" tab to trigger completion and navigate the menu
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" make enter confirm, and select first if not selected
" inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" cancel autocomplete with escape
" inoremap <expr> <Esc> pumvisible() ? '<C-e>' : '<Esc>'

" use j and k to scroll
inoremap <expr> <C-j> pumvisible() ? '<C-n>' : '<Nop>'
inoremap <expr> <C-k> pumvisible() ? '<C-p>' : '<Nop>'

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Also trigger completion with c-space
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gD :call <SID>show_documentation()<CR>

nnoremap <leader>tC :CocDisable<CR>
" nnoremap <leader>ce :CocEnable<CR>
nmap <leader>cr <Plug>(coc-rename)

" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Format, and Organise imports
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" }}}


" " ==============================================================================
" " Interesting words
" " ==============================================================================
" " {{{
" let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
" let g:interestingWordsDefaultMappings = 0
" nnoremap <silent> <leader>hh :call InterestingWords('n')<CR>
" nnoremap <silent> <leader>hH :call UncolorAllWords()<CR>
" nnoremap <silent> <leader>hn :call WordNavigation('forward')<CR>
" nnoremap <silent> <leader>hN :call WordNavigation('backward')<CR>
" nnoremap <leader>k <Nop>
" " }}}


" ==============================================================================
" Easy Motion Stuff
" ==============================================================================
" {{{
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys='jklhuiowertycvbnm;fj'
let g:EasyMotion_use_upper = 0
nmap s <Plug>(easymotion-overwin-f2)
" }}}


" ==============================================================================
" Tagbar
" ==============================================================================
" {{{
nmap <leader>T :TagbarToggle<CR>
let g:tagbar_auto_close=1
let g:tagbar_autofocus=1
let g:tagbar_sort=0 " sort by location
let g:tagbar_compact=1
let g:tagbar_indent=1
let g:tagbar_show_linenumbers=1
let g:tagbar_iconchars = ['▶', '▼']
" }}}


" ==============================================================================
" Git Stuff
" ==============================================================================
" {{{
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0
let g:gitgutter_sign_added              = '+'
let g:gitgutter_sign_modified           = '~'
let g:gitgutter_sign_removed            = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed   = '~'

nnoremap <leader>gg :GitGutterToggle<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>gb :Git Blame<CR>
nnoremap <leader>gl :Gclog<CR>
" }}}


" ==============================================================================
" Folding Stuff
" ==============================================================================
" {{{
" don't fold files by default
set foldlevelstart=99
au FileType vim set foldmethod=marker
" }}}


" ==============================================================================
" Open Browser Stuff
" ==============================================================================
" {{{
let g:web_search_query="https://www.google.com/search?q="
let g:web_search_command="firefox"
let g:web_search_use_default_mapping="no"

nmap go gx
vmap go gx
nnoremap <silent> gO :WebSearchCursor<CR>
vnoremap <silent> gO :WebSearchVisual<CR>
" }}}


" ==============================================================================
" Easy directory switching
" ==============================================================================
" {{{
function! s:root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' root
    echo 'Changed directory to: '.root
  endif
endfunction
command! Root call s:root()

nnoremap <leader>cdb :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>cdh :cd ~/<CR>:pwd<CR>
nnoremap <leader>cdp :Root<CR>
" }}}


" ==============================================================================
" OTHER
" ==============================================================================
" {{{
" Return to same line from when file last opened
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" diable paste when exit insert mode
au InsertLeave * silent! set nopaste

" don't hijack the v in html files...
let g:tagalong_mappings = ['c', 'C', 'i', 'a']

" Easy shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" auto source vimrc on change
" autocmd! BufWritePost $MYVIMRC nested source $MYVIMRC | AirlineToggle | AirlineToggle | AirlineRefresh

" no signcolumn for special windows
au FileType nerdtree setlocal signcolumn="no"
au FileType tagbar setlocal signcolumn="no"
au FileType undotree setlocal signcolumn="no"

syntax enable " At the end to ensure it's enabled once all themeing is done

" Make list-like commands more intuitive
function! CCR()
    let cmdline = getcmdline()
    if cmdline =~ '\v\C^(ls|files|buffers)'
        " like :ls but prompts for a buffer command
        return "\<CR>:b"
    elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
        " like :g//# but prompts for a command
        return "\<CR>:"
    elseif cmdline =~ '\v\C^(dli|il)'
        " like :dlist or :ilist but prompts for a count for :djump or :ijump
        return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
    elseif cmdline =~ '\v\C^(cli|lli)'
        " like :clist or :llist but prompts for an error/location number
        return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
    elseif cmdline =~ '\C^old'
        " like :oldfiles but prompts for an old file to edit
        set nomore
        return "\<CR>:sil se more|e #<"
    elseif cmdline =~ '\C^changes'
        " like :changes but prompts for a change to jump to
        set nomore
        return "\<CR>:sil se more|norm! g;\<S-Left>"
    elseif cmdline =~ '\C^ju'
        " like :jumps but prompts for a position to jump to
        set nomore
        return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
    elseif cmdline =~ '\C^undol'
        " like :undolist but prompts for a change to undo
        return "\<CR>:u "
    else
        return "\<CR>"
    endif
endfunction
cnoremap <expr> <CR> CCR()

" only highlight while search is in progress
augroup vimrc-incsearch-highlight
    au!
    au CmdlineEnter [/\?] :set hlsearch
    au CmdlineLeave [/\?] :set nohlsearch
augroup END

" No cursorline in insert mode
au InsertLeave,WinEnter * set cursorline
au InsertEnter,WinLeave * set nocursorline
" }}}


" ==============================================================================
" Hacks :(
" ==============================================================================
" {{{

" hack to fix recent polyglot update bug
au BufRead, BufNewFile, BufEnter FileType vim commentstring='" %s'

" need to figure out what is overwriting it...
au BufEnter * set formatoptions-=cro

" fix floating pop-up not removing in latest master branch coc-nvim
autocmd CursorMoved,CursorMovedI * call coc#util#float_hide()
" }}}


" ==============================================================================
" Disable in-built plugins
" ==============================================================================
" {{{
let g:loaded_getscriptPlugin = 1
" let g:loaded_netrwPlugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1
let g:loaded_gzip = 1
let g:loaded_rrhelper = 1
" }}}
