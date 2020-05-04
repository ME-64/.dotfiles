" {{{ Basic
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
set formatoptions+=jn                " remove comments on line join
set formatoptions-=t                 " no auto wrap
set formatoptions-=cro               " no auto commenting
set shortmess=atIAcFW                " no startup + auto comp message
set signcolumn=auto:4                " always show sign column
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set lazyredraw                       " don't update screen during macro
set textwidth=100                    " 100 chars for wrapping
set spelllang=en_gb                  " the queen's english
set complete+=kspell                 " autocomplete from dictionary w/spell
runtime macros/matchit.vim           " matching if elses
set foldmethod=indent                " simple folding
" }}}


"  {{{ File Searching
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


"  {{{ PLUGINS
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" File Navigation
Plug 'junegunn/fzf',  {'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'                                           " fzf from project roots
Plug 'scrooloose/nerdtree', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind', 'NERDTreeToggleVCS']}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTree', 'NERDTreeFocus', 'NERDTreeToggle', 'NERDTreeCWD', 'NERDTreeFind', 'NERDTreeToggleVCS']}
Plug 'mbbill/undotree', {'on': ['UndotreeToggle']}                   " visualise undo history

" Colours
Plug 'morhetz/gruvbox'                                               " Gruvbox theme
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
Plug 'dstein64/vim-startuptime'                                      " debug startup time
Plug 'linluk/vim-websearch'                                          " google terms
Plug 'AndrewRadev/undoquit.vim'                                      " <c-w>u reopen last close window
Plug 'junegunn/vim-peekaboo'                                         " see register content
Plug 'lfv89/vim-interestingwords'                                    " tag hl words when exploring code
Plug 'dominikduda/vim_current_word'                                  " syntax aware hl word under cursor
Plug 'airblade/vim-gitgutter'                                        " highlight chagnes & text obj

" Text Objects
Plug 'kana/vim-textobj-user'                                         " UD objects
Plug 'reedes/vim-textobj-sentence', {'for': ['markdown']}            " clever sentence objects
Plug 'michaeljsmith/vim-indent-object'                               " identation objects
Plug 'mattn/vim-textobj-url'                                         " url text obj
Plug 'glts/vim-textobj-comment'                                      " comments
Plug 'fvictorio/vim-textobj-backticks'                               " better backtick surround

" Motions & navigation
Plug 'rhysd/clever-f.vim'                                            " smart f/t movement
Plug 'chaoren/vim-wordmotion'                                        " improved word definiton
Plug 'AndrewRadev/sideways.vim'                                      " move arguments/li's around
Plug 'junegunn/vim-easy-align'                                       " horizontal alignment of words
Plug 't9md/vim-textmanip'                                            " shift text around, vertically
Plug 'easymotion/vim-easymotion'                                     " used like a better sneak

" Writing
Plug 'shime/vim-livedown', {'for': ['markdown']}                     " live preview of markdown
Plug 'tpope/vim-markdown', {'for': ['markdown']}
Plug 'dbmrq/vim-ditto'                                               " DRY, but for writing
Plug 'reedes/vim-wordy'                                              " check yo profanity
Plug 'reedes/vim-litecorrect'                                        " gentle auto correct

" Python stuff
Plug 'vim-python/python-syntax', {'for': ['python']}                 " Python syntax highlighting
Plug 'jeetsukumaran/vim-pythonsense', {'for': ['python']}            " objects for python
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']}            " better indent for python
Plug 'raimon49/requirements.txt.vim', {'for': ['requirements']}      " syntax highlight req.txt

" HTML / CSS stuff
Plug 'alvan/vim-closetag'                                            " close html tags
Plug 'Valloric/MatchTagAlways'                                       " html highlight tags
Plug 'AndrewRadev/tagalong.vim'                                      " auto change tag (surround is manual)

" General Language stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}                      " code completion
Plug 'Shougo/echodoc.vim'                                            " show function signatures
Plug 'dense-analysis/ale'                                            " better linting
Plug 'sheerun/vim-polyglot'                                          " for lesser used languages
Plug 'honza/vim-snippets'                                            " pre-built snippets
Plug 'majutsushi/tagbar'                                             " outline of file by class/function
Plug 'kassio/neoterm'                                                " quick toggle term + REPL

call plug#end()
filetype plugin indent on
" }}}


" {{{ THEME
set termguicolors

let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_current_word = 'grey background'

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
" }}}


"  {{{ BINDINGS
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

" good visual mode
nnoremap v <C-v>

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

" Easier indentation
noremap <Tab> >>
noremap <S-Tab> <<
vnoremap <Tab> >><esc>gv
vnoremap <S-Tab> <<<esc>gv

" Search results centered
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" mnemoinc top & bottom
noremap gk gg
noremap gj G

" moving between brackets simple
nmap 0 %

" Change text without putting the text into register,
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" rebinds semi-colon to toggle full cmd window
nnoremap ; q:
autocmd CmdwinEnter * noremap <buffer> ; :q<CR>

" switch to directory of current buffer
nnoremap <leader>cdb :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>cdh :cd ~/<CR>:pwd<CR>

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

" Run python files easily
autocmd FileType python nnoremap <buffer> <leader>rf :!python3 %<cr>

" Run nodejs easily
autocmd FileType javascript nnoremap <buffer> <leader>rf :!node %<cr>

" jump to end tag in html
autocmd FileType html nnoremap <silent> <buffer> ) :MtaJumpToOtherTag<CR>

" useful buffer switching
nnoremap <silent> = :bn <cr>
nnoremap <silent> - :bp <cr>
nnoremap <silent> _ :bd <cr>

" small tweak to vim-surround. I don't use default v_S
vmap s S

" consistent closing of windows
nnoremap <C-w>q <C-w>c
nnoremap <C-w><C-q> <C-w>c

" text movement with ALT
nnoremap <silent> <M-l> :SidewaysRight<CR>
nnoremap <silent> <M-h> :SidewaysLeft<CR>
xmap <M-j> <Plug>(textmanip-move-down)
xmap <M-k> <Plug>(textmanip-move-up)
nmap <M-j> <Plug>(textmanip-move-down)
nmap <M-k> <Plug>(textmanip-move-up)
" }}}


" {{{ Spelling / Writing Mode
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

autocmd! BufEnter, BufNewFile let b:writing_mode=0
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
        DittoOff
        silent NoWordy
        let b:writing_mode=0
        echo("Writing Mode Off")
    endif
endfunction
" }}}


" {{{ Find & Replace Functionality (TODO)
nnoremap <C-s>r :%s/
vnoremap <C-s>r :s/
" }}}


"  {{{ Clever F settings
let g:clever_f_across_no_line=1
let g:clever_f_ignore_case=1
let g:clever_f_smart_case=1
let g:clver_f_fix_key_direction=1
" }}}


" {{{ Yank Stuff
let g:highlightedyank_highlight_duration=5000
" }}}


" {{{ Distraction Free Mode
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
  autocmd InsertLeave,WinEnter * set nocursorline
  autocmd InsertEnter,WinLeave * set nocursorline
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
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
  let b:coc_suggest_disable = 0
  VimCurrentWordToggle
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}


" {{{ Colour Highlighting
let g:Hexokinase_highlighters=['foreground']
" let g:Hexokinase_ftEnabled=['css', 'html', 'javascript']
" }}}


" {{{ Formatting Stuff
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


" {{{ UndoTree Stuff
nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_WindowLayout=4
let g:undotree_SplitWidth=40
let g:undotree_SetFocusWhenToggle=1
let g:undotree_ShortIndicators=1
" }}}


" {{{ Polyglot Stuff
let g:polyglot_disabled=['python', 'markdown', 'vim']
" }}}


" {{{ Neovim Terminal Configuration
" escape goes to normal mode and c-v esc sends to program (and don't break fzf)
tnoremap <C-s><esc> <C-\><C-n>
autocmd! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
autocmd! FileType fzf tunmap <buffer> <Esc>

" Opening splits with terminal in all directions
" nnoremap <Space>h<CR> :leftabove  vnew<CR>:terminal<CR>i
" nnoremap <Space>l<CR> :rightbelow vnew<CR>:terminal<CR>i
" nnoremap <Space>k<CR> :leftabove  new<CR>:terminal<CR>i
" nnoremap <Space>j<CR> :rightbelow new<CR>:terminal<CR>i
nnoremap <C-Space><CR> :terminal<CR>i

" close terminal like any other buffer
autocmd TermOpen * nnoremap <buffer> _ :bd! <CR>

" " edit the currently in progress command in normal mode
" if exists(':terminal')
"   " Readline cheatsheet:
"   " ctrl-a - jump to start of line
"   " ctrl-e - jump to end of line
"   " ctrl-k - kill forwards to the end of line
"   " ctrl-u - kill backwards to the start of line
"   autocmd TermOpen * nnoremap <buffer> I I<C-a>
"   autocmd TermOpen * nnoremap <buffer> A A<C-e>
"   autocmd TermOpen * nnoremap <buffer> C A<C-k>
"   autocmd TermOpen * nnoremap <buffer> D A<C-k><C-\><C-n>
"   autocmd TermOpen * nnoremap <buffer> cc A<C-e><C-u>
"   autocmd TermOpen * nnoremap <buffer> dd A<C-e><C-u><C-\><C-n>
"   autocmd FileType fzf * nunmap <buffer> I
"   autocmd FileType fzf * nunmap <buffer> A
"   autocmd FileType fzf * nunmap <buffer> C
"   autocmd FileType fzf * nunmap <buffer> D
"   autocmd FileType fzf * nunmap <buffer> cc
"   autocmd FileType fzf * nunmap <buffer> dd
"   autocmd FileType fzf * nunmap <buffer> _
" endif

" neoterm plugin setings
let g:neoterm_autoinsert=0
let g:neoterm_default_mod='botright'
let g:neoterm_size=12
let g:neoterm_repl_python='python3'
let g:neoterm_direct_open_repl=0
let g:neoterm_eof=''
nnoremap <silent> <leader>` :Ttoggle<CR>
nmap <leader><CR> <Plug>(neoterm-repl-send-line)
xmap <leader><CR> <Plug>(neoterm-repl-send)



" }}}


" {{{ Toggle Stuff
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
"  : same word hghlighting
nnoremap <leader>tb :setlocal background=<C-R>=&background == "dark" ? "light" : "dark"<CR><CR>
nnoremap <leader>tp :setlocal invpaste paste?<CR>
nnoremap <silent> <leader>tn :exec &nu==&rnu? "setlocal nu!" : "setlocal rnu!"<CR>
nnoremap <leader>tw :setlocal wrap!<CR>
nnoremap <leader>tl :setlocal cursorline!<CR>
nnoremap <leader>tc :setlocal cursorcolumn!<CR>

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


" {{{ Python
let g:is_pythonsense_suppress_object_keymaps = 1
let g:is_pythonsense_suppress_motion_keymaps = 1
let g:is_pythonsense_suppress_location_keymaps = 1
let g:python_highlight_all = 1
" }}}


" {{{ Ulti Snips
let g:ultisnips_python_style='numpy'
" }}}


"  {{{ JavaScript Snippets
autocmd! FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd! FileType javascript nnoremap <buffer> <leader>jc ^iconsole.log(<esc>A);<esc>
autocmd! FileType javascript vnoremap <buffer> <leader>jc diconsole.log(<esc>p`]li);<esc>
" }}}


" {{{ HTML Stuff
" treat all htmldjangofiles as html (for ftplugins)
autocmd! FileType htmldjango set filetype=html
autocmd! FileType html setlocal shiftwidth=2 softtabstop=2 expandtab

" " then add back django syntax
" syn region  djangotagmarkers start="{{" end="}}"
" syn region  djangovariablemarkers start="{%" end="%}"
" command! -nargs=+ HiLink hi def link <args>
" HiLink djangotagmarkers PreProc
" HiLink djangovariablemarkers PreProc
" delcommand HiLink
" }}}


" {{{ Markdown Stuff
" augroup pandoc_syntax
"     au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END
let g:markdown_fenced_languages=['html', 'css', 'javascript', 'python', 'js=javascript', 'py=python']
" let g:markdown_minlines = 100
let g:markdown_folding=1
let g:livedown_autorun = 0
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser='firefox'
autocmd! BufNewFile,BufFilePre,BufRead *.md set ft=markdown


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
autocmd! BufNewFile,BufFilePre,BufRead *.md setlocal formatoptions+=t
autocmd! BufNewFile,BufFilePre,BufRead *.md setlocal shiftwidth=2
autocmd! BufNewFile,BufFilePre,BufRead *.md setlocal softtabstop=2
autocmd! BufNewFile,BufFilePre,BufRead *.md setlocal expandtab
autocmd! BufNewFile,BufFilePre,BufRead *.md setlocal textwidth=80
autocmd! BufNewFile,BufFilePre,BufRead *.md call textobj#sentence#init()
" }}}


" {{{ Indent Line Stuff
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent=90
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_default_mapping = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'fzf']
autocmd! VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3c3836
autocmd! VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3836
nnoremap <silent> <Leader>tg :IndentGuidesToggle<CR>
" }}}


" {{{ fzf options
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

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . shellescape(<q-args>), 1, {"dir": FindRootDirectory()})

nnoremap <silent> <C-f>f :call fzf#vim#files('.', {'options': '--prompt "" --border "rounded"'})<CR>
" noremap <silent> <C-f>p :call fzf#vim#files(FindRootDirectory(), {'options': '--prompt "" --border "rounded"', 'dir': FindRootDirectory()})<CR>
nnoremap <silent> <C-f>b :call fzf#vim#buffers({'options': '--prompt "" --border "rounded"'})<CR>
" nnoremap <C-f>b :ls<CR>:b
" nnoremap <C-f>m :marks<CR>:norm! `
nnoremap <C-F>m :Marks<CR>
nnoremap <C-f>o :History<CR>
nnoremap <C-f>h :Helptags<CR>
nnoremap <silent> <C-f>l :call fzf#vim#buffer_lines({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f>L :call fzf#vim#lines({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f>d :call fzf#run(fzf#wrap({'source': 'find ~/* -type d', 'sink': 'cd'}))<CR>
nnoremap <silent> <C-f>p :Rg<space>
" and the hold down variant
nnoremap <silent> <C-f><C-f> :call fzf#vim#files('.', {'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f><C-b> :call fzf#vim#buffers({'options': '--prompt "" --border "rounded"'})<CR>
" nnoremap <C-f><C-b> :ls<CR>:b
" nnoremap <C-f><C-m> :marks<CR>:norm! `
nnoremap <C-F><C-m> :Marks<CR>
nnoremap <C-f><C-o> :History<CR>
nnoremap <C-f><C-h> :Helptags<CR>
nnoremap <silent> <C-f><C-l> :call fzf#vim#buffer_lines({'options': '--prompt "" --border "rounded"'})<CR>
nnoremap <silent> <C-f><C-d> :call fzf#run(fzf#wrap({'source': 'find ~/* -type d'}))<CR>
nnoremap <silent> <C-f><C-p> :Rg<space>
" noremap <silent> <C-f><C-p> :call fzf#vim#files(FindRootDirectory(), {'options': '--prompt "" --border "rounded"', 'dir': FindRootDirectory()})<CR>
" }}}


" {{{ Airline Stuff
" Automatically display open buffers when only 1 tab
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#show_splits=0
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
let g:airline#extensions#tabline#ignore_bufadd_pat = 'defx|gundo|nerd_tree|startify|tagbar|undotree|vimfiler|fzf|neoterm'
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

" fixes slow insert mode leaving
if ! has('gui_running')
    " set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertEnter * set timeout
        au InsertLeave * set timeoutlen=1000
        au InsertLeave * set notimeout
    augroup END
endif
" }}}


" {{{ Text Object mappings
" if/af - functions, aC/iC - class, ai/ii - indent, au/iu - urls, ac/ic - comments, ah/ih - git changes
omap aC <Plug>(PythonsenseOuterClassTextObject)
omap iC <Plug>(PythonsenseInnerClassTextObject)
omap af <Plug>(PythonsenseOuterFunctionTextObject)
omap if <Plug>(PythonsenseInnerFunctionTextObject)

vmap aC <Plug>(PythonsenseOuterClassTextObject)
vmap iC <Plug>(PythonsenseInnerClassTextObject)
vmap af <Plug>(PythonsenseOuterFunctionTextObject)
vmap if <Plug>(PythonsenseInnerFunctionTextObject)

" Arguments w/ sideways
omap <silent> aa <Plug>SidewaysArgumentTextobjA
xmap <silent> aa <Plug>SidewaysArgumentTextobjA
omap <silent> ia <Plug>SidewaysArgumentTextobjI
xmap <silent> ia <Plug>SidewaysArgumentTextobjI

" Git changes
omap ig <Plug>(GitGutterTextObjectInnerPending)
omap ag <Plug>(GitGutterTextObjectOuterPending)
xmap ig <Plug>(GitGutterTextObjectInnerVisual)
xmap ag <Plug>(GitGutterTextObjectOuterVisual)

"line text objects
xnoremap il g_o^
onoremap il :<C-u>normal vil<CR>
xnoremap al $o0
onoremap al :<C-u>normal val<CR>

" entire document
xnoremap ad <esc>vggoVG
onoremap ad :<C-u>normal vad<CR>

xnoremap ir i[
xnoremap ar a[
onoremap ir :normal vi[<CR>
onoremap ar :normal va[<CR>

" Lots of delimiters
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '-', '#' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor
" }}}


" {{{ Signature Stuff (Marks)
let g:SignatureEnabledAtStartup=0
nnoremap <leader>tm :SignatureToggleSigns<CR>
let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "mm",
            \ 'ToggleMarkAtLine'   :  "",
            \ 'PurgeMarksAtLine'   :  "",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarks'         :  "",
            \ 'PurgeMarkers'       :  "",
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


" {{{ NERDTree Stuff
let g:NERDTreeMinimalUI=1 " nerd tree hiding help button
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=35
let g:NERDTreeDirArrows=1
let g:NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '__pycache__', '__pycache__','.git', '.ipynb_checkpoints', '.DS_Store', '.localized', 'venv']
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeSortOrder = map(range(0, 25), '"\\." . nr2char(char2nr("a") + v:val) . "[^.]*$"')
" let NERDTreeSortOrder=['\/$', '*']
let g:webdevicons_conceal_nerdtree_brackets=1
let g:NERDTreeHighlightCursorline = 0
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
nnoremap <silent> <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>ng :NERDTreeToggleVCS<CR>
" }}}


" {{{ Ale (Linting)
" disabled by default
let g:ale_enabled = 0
nnoremap <leader>ta :ALEToggle<CR>
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed='never'
let g:ale_lsp_show_message_severity='error'
let g:ale_linters_explicit = 1
let g:ale_linters = {
            \ 'python': ['flake8'],
            \ 'javascript': ['prettier'],
            \ 'markdown': ['prettier'],
            \ 'css': ['prettier']
            \ }
let g:ale_fixers = {
            \ 'javascript': ['prettier'],
            \ 'html': ['prettier'],
            \ 'css': ['prettier'],
            \ 'python': ['autopep8', 'isort'],
            \ 'markdown': ['prettier']
            \ }
" lint inline html & css
let g:ale_linter_aliases = {'html': ['html', 'javascript', 'css']}
let g:ale_use_global_executables = 1
let g:ale_virtualenv_dir_names= ['.env', '.venv', 'env', 'virtualenv', 'venv']
let g:ale_warn_about_trailing_whitespace=0
let g:ale_warn_about_trailing_blank_lines=0
nnoremap <leader>fl :ALEFix<CR>
" }}}


" {{{ Auto Complete Stuff
let g:coc_global_extensions = ['coc-python', 'coc-html', 'coc-css', 'coc-json', 'coc-vimlsp', 'coc-snippets']

" tab to trigger completion and navigate the menu
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" cancel autocomplete with escape
inoremap <expr> <Esc> pumvisible() ? '<C-e>' : '<Esc>'
" make enter confirm, and select first if not selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Also trigger completion with c-space
" inoremap <silent><expr> <c-space> coc#refresh()

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


" {{{ Echo Doc function signatures
let g:echodoc#enable_at_startup=1
let g:echodoc#type="echo"
" }}}


" {{{ Interesting words
let g:interestingWordsDefaultMappings = 0
let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
nnoremap <silent> <leader>hh :call InterestingWords('n')<CR>
nnoremap <silent> <leader>hH :call UncolorAllWords()<CR>
nnoremap <silent> <leader>hn :call WordNavigation('forward')<CR>
nnoremap <silent> <leader>hN :call WordNavigation('backward')<CR>
" }}}


" {{{ Easy Motion Stuff
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys='jklhuiowertycvbnm;fj'
let g:EasyMotion_use_upper = 0
nmap s <Plug>(easymotion-overwin-f2)
" }}}


" {{{ Tagbar
nmap <leader>T :TagbarToggle<CR>
let g:tagbar_auto_close=1
let g:tagbar_autofocus=1
let g:tagbar_sort=0 " sort by location
let g:tagbar_compact=1
let g:tagbar_indent=1
let g:tagbar_show_linenumbers=1
let g:tagbar_iconchars = ['▶', '▼']
" }}}


" {{{ Git Stuff
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


" {{{ Folding Stuff
" don't fold files by default
set foldlevelstart=99
autocmd! FileType vim set foldmethod=marker
" }}}


" {{{ Open Browser Stuff
let g:web_search_query="https://www.google.com/search?q="
let g:web_search_command="firefox"
let g:web_search_use_default_mapping="no"

nmap go gx
vmap go gx
nnoremap <silent> gO :WebSearchCursor<CR>
vnoremap <silent> gO :WebSearchVisual<CR>
" }}}


" {{{ OTHER
" Return to same line from when file last opened
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" don't hijack the v in html files...
let g:tagalong_mappings = ['c', 'C', 'i', 'a']

" auto source vimrc on change
" autocmd! BufWritePost $MYVIMRC nested source $MYVIMRC | AirlineToggle | AirlineToggle | AirlineRefresh

" no signcolumn for special windows
autocmd! FileType nerdtree setlocal signcolumn="no"
autocmd! FileType tagbar setlocal signcolumn="no"
autocmd! FileType undotree setlocal signcolumn="no"

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
    autocmd!
    autocmd CmdlineEnter [/\?] :set hlsearch
    autocmd CmdlineLeave [/\?] :set nohlsearch
augroup END

" No cursorline in insert mode
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
" }}}


" {{{ Hacks :(
" make undoquit work for <c-w>c too
nnoremap <silent> <c-w>c :call undoquit#SaveWindowQuitHistory()<cr><c-w>c

" hack to fix recent polyglot update bug
autocmd! BufRead, BufNewFile, BufEnter FileType vim commentstring='" %s'

" need to figure out what is overwriting it...
autocmd! BufEnter * set formatoptions-=cro
" }}}
