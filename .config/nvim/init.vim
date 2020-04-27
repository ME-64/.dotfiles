" --------------------------------------------------------
"  Basic
" -------------------------------------------------------- 
set clipboard=unnamedplus            " Using system clipboard
set nocompatible                     " Not comaptible with Vi
set number relativenumber            " Line Numbers
set expandtab                        " Convert Tabs to spaces
set tabstop=4                        " Default tab for files
set softtabstop=4                    " Defualt tabs for files
set shiftwidth=4                     " Default tabs for files
set breakindent                      " Wrapped lines same indent
set breakindentopt=sbr               " Wrapping
set showbreak=↪>\                    " character to show break
set nowrap                           " Disabled by default, toggled on
set undodir=~/.vim/undodir           " Better undos
set undofile                         " Better undos 
set undolevels=10000                 " Better undos
set undoreload=100000                " Better undos
set fileformat=unix                  " Unix file format by default
set fillchars=vert:│,fold:-          " Setting divider character
set fillchars+=stlnc:-               " Setting divider character
set noshowmode                       " Keep cmd clean
set noshowcmd                        " Keep cmd clean
set nohlsearch                       " Enable highlight on search
set splitbelow                       " Default split positions
set splitright                       " Default split positions
set encoding=utf-8                   " Default encoding
set autoindent                       " Better indentation
" set smartindent                      " Better indentation
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
set ttimeout                         " Less delay leaving insert mode
set ttimeoutlen=400                  " Above
set timeoutlen=400                   " Above
set cursorline                       " Column where line is
set ttyfast                          " fast term!
set incsearch                        " Incremental Searching
set inccommand=split                 " Live substitutions
set nowritebackup                    " disable
set updatetime=100                   " quicker updating
set conceallevel=0                   " back to default
set modeline                         " use modelines
set backspace=indent,eol,start       " correct backspace
set ve=all                           " virtual editing
set grepprg=rg\ --vimgrep            " use ripgrep for grepping
set formatoptions-=cro               " no auto commenting
set shortmess=atIAc                  " no startup + auto comp message
set signcolumn=yes                   " always show sign column
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set formatoptions+=j                 " delete comment char when join
set lazyredraw                       " don't update screen during macro
set textwidth=80                     " 100 chars for wrapping

" --------------------------------------------------------
"  File Searching
" --------------------------------------------------------
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
set wildignore+=.cache,node_modules,package-lock.json,yarn.lock,dist,.git
set wildignore+=.vimruncmd
command! MakeTags !ctags -R .

" --------------------------------------------------------
"  PLUGINS
" --------------------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'                                    " file browser
Plug 'ryanoasis/vim-devicons'                                 " Icons for NERDTree
Plug 'tpope/vim-commentary'                                   " gcc to comment and uncomment things
Plug 'morhetz/gruvbox'                                        " Gruvbox theme
Plug 'vim-airline/vim-airline'                                " Simple Status line
Plug 'vim-airline/vim-airline-themes'                         " Simple Status line
Plug 'machakann/vim-highlightedyank'                          " Highlight text that has been yanked
Plug 'junegunn/goyo.vim'                                      " Distraction free mode
Plug 'vim-python/python-syntax'                               " Python syntax highlighting
Plug 'jpalardy/vim-slime'                                     " vim REPL support
Plug 'tpope/vim-surround'                                     " easy quotes
Plug 'tpope/vim-fugitive'                                     " git integration
Plug 'tpope/vim-repeat'                                       " let . work for plugins
Plug 'gcmt/taboo.vim'                                         " rename tabs
Plug 'rhysd/clever-f.vim'                                     " smart f/t movement
Plug 'nathanaelkane/vim-indent-guides'                        " indentation
Plug 'michaeljsmith/vim-indent-object'                        " identation objects
Plug 'jeetsukumaran/vim-pythonsense'                          " objects for python
Plug 'jiangmiao/auto-pairs'                                   " auto close brackets
Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}       " highlighting of colours
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'} " syntax highlight req.txt
Plug 'junegunn/fzf',  {'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}               " code completion
Plug 'shime/vim-livedown'                                     " live preview of markdown
Plug 'chaoren/vim-wordmotion'                                 " improved word definiton
Plug 'sheerun/vim-polyglot'                                   " for lesser used lngs
Plug 'Vimjas/vim-python-pep8-indent'                          " better indent for python
call plug#end()
filetype plugin indent on

" --------------------------------------------------------
" THEME
" --------------------------------------------------------
"set t_Co=256              " Depends on setup for which to use
set termguicolors          " Depends on setup for which to use
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_color_column="bg1"
let g:gruxbox_number_column="bg1"
let g:gruvbox_bold=1
let g:gruvbox_invert_selection=0

" --------------------------------------------------------
"  BINDINGS 
" --------------------------------------------------------
" Leader remap
nnoremap <SPACE> <Nop>

let mapleader = " "
" Inserting new lines without leaving normal mode
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
" Clear highlighting with _
" nnoremap <silent> _ :noh<CR>
" Save files when you forgot to sudo into it
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
" Better saving
nmap <leader>w :w!<cr> 
" Better quitting & saving
nmap <leader>q :q<cr>
map <silent> <leader>e :NERDTreeToggle<CR>
" nnoremap <leader>b :ls<cr>:b<space>
nmap Q <Nop>

" correct y
noremap Y y$

" good visual mode
nnoremap v <C-v>

" Better navigation
noremap <C-k> <C-u><C-u>
noremap <C-j> <C-d><C-d>
noremap J <c-d>
noremap K <c-u>
noremap H 0
noremap L $


" Easier indentation
noremap <Tab> >>
noremap <S-Tab> <<
vnoremap <Tab> >><esc>gv
vnoremap <S-Tab> <<<esc>gv

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz

" Change text without putting the text into register,
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" rebinds semi-colon to enter full cmd window
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

" No Arrow keys!
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>

" textwidth in visual mode
vnoremap <leader>fw gqi<esc>
vnoremap <leader>fi =<esc>

" Run pthon files easily
autocmd FileType python nnoremap <buffer> <leader>pr :!clear; python3 %<cr>

" --------------------------------------------------------
" OTHER
" ------------------------------------------------------- 
" Return to same line from when file last opened
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

syntax enable " At the end to ensure it's enabled once all themeing is done
let g:python_highlight_all = 1

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
    elseif cmdline =~ '\C^marks'
        " like :marks but prompts for a mark to jump to
        return "\<CR>:norm! `"
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

" --------------------------------------------------------
"  Clever F settings 
" --------------------------------------------------------
let g:clever_f_across_no_line=1
let g:clever_f_ignore_case=1
let g:clever_f_smart_case=1
let g:clver_f_fix_key_direction=1

" --------------------------------------------------------
" Yank Stuff
" --------------------------------------------------------
let g:highlightedyank_highlight_duration=5000

" --------------------------------------------------------
" Distraction Free Mode
" --------------------------------------------------------
nnoremap <leader>tG :Goyo<CR>

" --------------------------------------------------------
" Colour Highlighting
" --------------------------------------------------------
let g:Hexokinase_highlighters=['foreground']
" let g:Hexokinase_ftEnabled=['css', 'html', 'javascript']

" --------------------------------------------------------
" WordMotion Stuff
" --------------------------------------------------------


" --------------------------------------------------------
" Polyglot Stuff
" --------------------------------------------------------
let g:polyglot_disabled=['python', 'markdown']


" --------------------------------------------------------
" Toggle Stuff
" --------------------------------------------------------
" b: background
" p: paste
" n: linenumbers
" w: wrap
" l: cursorline
" c: cursorcolumn
" s: spelling
" q: colour column
nnoremap <leader>tb :set background=<C-R>=&background == "dark" ? "light" : "dark"<CR><CR>
nnoremap <leader>tp :set invpaste paste?<CR>
nnoremap <silent> <leader>tn :exec &nu==&rnu? "set nu!" : "set rnu!"<CR>
nnoremap <leader>tw :set wrap!<CR>
nnoremap <leader>tl :set cursorline!<CR>
nnoremap <leader>tc :set cursorcolumn!<CR>
nnoremap <leader>ts :set spell!<CR>

set colorcolumn=
set cc=
fun! ToggleCC()
 if &cc == ''

   set cc=80
 elseif &cc == 80
   set cc=100
 else
   set cc=
 endif
endfun

nnoremap <silent> <leader>te :call ToggleCC()<CR>

" --------------------------------------------------------
" Python Sense Stuff
" -------------------------------------------------------- 
let g:is_pythonsense_supress_motion_keymaps=1
let g:is_pythonsense_supress_location_keymaps=1

" --------------------------------------------------------
" Markdown Stuff
" -------------------------------------------------------- 
" augroup pandoc_syntax
"     au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END
let g:livedown_autorun = 0
let g:livedown_open = 1
let g:livedown_port = 1337
let g:livedown_browser='firefox'
nnoremap <leader>mv :LivedownToggle<CR>
nnoremap <leader>mh1 yypv$r=
nnoremap <leader>mh2 yypv$r-
nnoremap <leader>mh3 ^i###<space><esc>
nnoremap <leader>mh4 ^i####<space><esc>
nnoremap <leader>mh5 ^i#####<space><esc>
nnoremap <leader>mh6 ^i######<space><esc>
nnoremap <leader>mc 0i```<CR><CR>```<esc>kka


" --------------------------------------------------------
" Indent Line Stuf
" -------------------------------------------------------- 
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0
let g:indent_guides_color_change_percent=90
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
let g:indent_guides_default_mapping = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'fzf']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3c3836
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3836
nnoremap <Leader>tg <Plug>IndentGuidesToggle

" --------------------------------------------------------
" fzf options
" -------------------------------------------------------- 
let g:fzf_colors =
   \ { 'fg':      ['fg', 'Normal'],
   \ 'bg':      ['bg', 'Normal'],
   \ 'hl':      ['fg', 'Comment'],
   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
   \ 'hl+':     ['fg', 'Statement'],
   \ 'info':    ['fg', 'PreProc'],
   \ 'border':  ['fg', 'Ignore'],
   \ 'prompt':  ['fg', 'Conditional'],
   \ 'pointer': ['fg', 'Exception'],
   \ 'marker':  ['fg', 'Keyword'],
   \ 'spinner': ['fg', 'Label'],
   \ 'header':  ['fg', 'Comment'] }

let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=0,0'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_preview_windows=''

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(20)
  let width = float2nr(60)
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

noremap <leader>f :call fzf#vim#files('.', {'options': '--prompt "" --border "rounded"'})<CR>
noremap <leader>b :call fzf#vim#buffers({'options': '--prompt "" --border "rounded"'})<CR>


let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
"  \ 'ctrl-t': 'tab split',

" --------------------------------------------------------
" Airline Stuff
" -------------------------------------------------------- 
" Automatically display open buffers when only 1 tab
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#show_splits=0
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#wordcount#enabled=0
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#taboo#enabled = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline_theme='gruvbox'
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
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" --------------------------------------------------------
" Devicons Stuff
" -------------------------------------------------------- 
let g:webdevicons_conceal_nerdtree_brackets=1

" --------------------------------------------------------
" NERDTree Stuff 
" -------------------------------------------------------- 
let NERDTreeMinimalUI=1 " nerd tree hiding help button
let NERDTreeShowHidden=1
let NERDTreeWinSize=35
let NERDTreeDirArrows=1
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '__pycache__', '__pycache__','.git', '.ipynb_checkpoints', '.DS_Store', '.localized', 'venv']
let NERDTreeQuitOnOpen=1
let NERDTreeHighlightCursorline = 0
let NERDTreeShowLineNumbers=1
let NERDTreeSortOrder=['\/$', '*']

" --------------------------------------------------------
" Auto Complete Stuff
" -------------------------------------------------------- 
let g:coc_global_extensions = ['coc-python', 'coc-html', 'coc-css', 'coc-vimlsp', 'coc-json']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" cancel autocomplete with escape
inoremap <expr> <Esc> pumvisible() ? '<C-y>' : '<Esc>'
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)
" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Format, and Organise imports
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
