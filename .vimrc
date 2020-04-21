" --------------------------------------------------------
" Minimal vimrc
" --------------------------------------------------------

" --------------------------------------------------------
"  PLUGINS - NEED Vundle Installed 
" --------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'                            " gcc to comment and uncomment things
Plugin 'tpope/vim-surround'                              " easy quotes
Plugin 'tpope/vim-unimpaired'                            " good toggle mappings
Plugin 'tpope/vim-repeat'                                " let . work for plugins
call vundle#end()
filetype plugin indent on 

" --------------------------------------------------------
"  Basic
" -------------------------------------------------------- 
set clipboard=unnamedplus            " Using system clipboard
set nocompatible                     " Not comaptible with Vi
filetype off                         " Needed for Vundle
set number relativenumber            " Line Numbers
set expandtab                        " Convert Tabs to spaces
set tabstop=4                        " Default tab for files
set softtabstop=4                    " Defualt tabs for files
set shiftwidth=4                     " Default tabs for files
set nowrap                           " Disabled by default, toggled on
set undodir=~/.vim/undodir           " Better undos
set undofile                         " Better undos 
set undolevels=10000                 " Better undos
set undoreload=100000                " Better undos
set fileformat=unix                  " Unix file format by default
set fillchars=vert:│,fold:-          " Setting divider character
set fillchars+=stlnc:-               " Setting divider character
set nohlsearch                       " Enable highlight on search
set splitbelow                       " Default split positions
set splitright                       " Default split positions
set encoding=utf-8                   " Default encoding
set autoindent                       " Better indentation
set smartindent                      " Better indentation
set smarttab                         " Better indentation
set noswapfile                       " Swaps bad
set nobackup                         " backups bad
set scrolloff=2                      " chars between cursor & endscreen
set sidescroll=1                     " side scrolloff
set wildmenu                         " Autocomplete for cmd
set wildmode=longest,list,full       " Autocomplete for cmd
set autoread                         " Auto update files changed outside of vim
set hid                              " Lets you open new files while unsaved changes
set ignorecase                       " case insensitve search
set smartcase                        " Unless you use uppercase
set showmatch                        " Show matching brackets
set magic                            " Regex Magic
set noerrorbells                     " No bells
set novisualbell                     " No visual bells
set t_vb=                            " No sounds
set ttimeout                         " Less delay leaving insert mode
set ttimeoutlen=1
set cursorline                       " Column where line is
set incsearch                        " Incremental Searching
set ttyfast
set nowritebackup                    " disable
set updatetime=100                   " quicker updating
set conceallevel=0                   " back to default
set shiftround                       " round indent to multiples of shiftwidth
set backspace=indent,eol,start       " correct backspace
set ve=all                           " virtual editing
set formatoptions-=cro               " no auto commenting
" File searching stuff
set path=.                           " Default path
set path+=**                         " search subfolders
set wildignore+=**/venv/**           " Ignoring stuff in virtual environment
set wildignore+=**/.git/**           " Ignoring stuff in git
set wildignore+=*.pyc                " Ignoring cache
set wildignore+=**/__pycache__/**    " Ignoring cache
set laststatus=2                     " Always show statusline
syntax enable                        " highlighting!

" --------------------------------------------------------
" THEME
" -------------------------------------------------------- 
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif
let colors_name = "comments"
hi Normal       ctermfg=15 ctermbg=0
hi Comment      cterm=NONE ctermfg=66
hi Constant     cterm=NONE ctermfg=15
hi Identifier   cterm=NONE ctermfg=15
hi Function     cterm=NONE ctermfg=15
hi Statement    cterm=NONE ctermfg=15
hi PreProc      cterm=NONE ctermfg=15
hi Type	        cterm=NONE ctermfg=15
hi Special      cterm=NONE ctermfg=15
hi Delimiter    cterm=NONE ctermfg=15
hi CursorLine   cterm=NONE ctermfg=15 ctermbg=8
hi CursorLineNR cterm=bold ctermfg=3

" --------------------------------------------------------
" Simple Status Line
" -------------------------------------------------------- 
set statusline=
set statusline+=%7*\[%n]                 "buffernr
set statusline+=%1*\ %<%F\               "File+path
set statusline+=%2*\ %y\                 "FileType
set statusline+=%8*\ %=\ R:%l/%L\        "Rownumber/total
set statusline+=%9*\ C:%03c\             "Colnr

" --------------------------------------------------------
" Cursor On Insert Change
" -------------------------------------------------------- 
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

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
nnoremap <silent> _ :noh<CR>
" Save files when you forgot to sudo into it
command! W execute 'w !sudo tee % > /dev/null' <bar> edit! 
" Better saving
nmap <leader>w :w!<cr> 
" Better quitting
nmap <leader>q :q<cr>

" --------------------------------------------------------
" OTHER
" -------------------------------------------------------- 
" Return to same line from when file last opened
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

