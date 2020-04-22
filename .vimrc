" ########################################################
" #################MINIMAL VIMRC##########################
" ########################################################

" --------------------------------------------------------
"  PLUGINS
" --------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'                            
Plugin 'tpope/vim-surround'                              
Plugin 'tpope/vim-unimpaired'                            
Plugin 'tpope/vim-repeat'                                
Plugin 'morhetz/gruvbox'
call vundle#end()
filetype plugin indent on 

" --------------------------------------------------------
"  BASICS
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
set wildmode=full                    " Autocomplete for cmd
set autoread                         " Auto update files changed outside of vim
set hid                              " Lets you open new files while unsaved changes
set ignorecase                       " case insensitve search
set smartcase                        " Unless you use uppercase
set magic                            " Regex Magic
set noerrorbells                     " No bells
set novisualbell                     " No visual bells
set t_vb=                            " No sounds
set ttimeout                         " Less delay leaving insert mode
set ttimeoutlen=1
" set cursorline                       " Column where line is
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
set showcmd

" --------------------------------------------------------
" THEME
" -------------------------------------------------------- 
colorscheme gruvbox
set termguicolors
set background=dark
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_color_column="bg1"
let g:gruxbox_number_column="bg1"
let g:gruvbox_bold=0
let g:gruvbox_invert_selection=0
syntax enable               
" --------------------------------------------------------
" STATUSLINE
" -------------------------------------------------------- 
set statusline=
set statusline+=%1*
set statusline+=\ 
set statusline+=%1*
set statusline+=%f
set statusline+=\ 
set statusline+=%m
set statusline+=%=
set statusline+=%1*
set statusline+=%y
set statusline+=\ 
set statusline+=%l
set statusline+=:
set statusline+=%L
set statusline+=:
set statusline+=%c
set statusline+=\ 
hi User1 ctermbg=darkgray ctermfg=blue guibg=#504945 guifg=#a89984

" --------------------------------------------------------
" CURSOR
" -------------------------------------------------------- 
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" --------------------------------------------------------
"  BINDINGS 
" -------------------------------------------------------- 
" Leader remap
nnoremap <SPACE> <Nop>
let mapleader = " "
" Inserting new lines without leaving normal mode
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" Save files when you forgot to sudo into it
command! W execute 'w !sudo tee % > /dev/null' <bar> edit! 

nnoremap <leader>b :ls<cr>:b<space>

" --------------------------------------------------------
" OTHER
" -------------------------------------------------------- 
" Return to same line from when file last opened
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
