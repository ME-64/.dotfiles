set clipboard=unnamedplus
set number relativenumber
set tabstop=4 softtabstop=4 shiftwidth=4 shiftround expandtab smarttab
set undodir=~/.vim/undodir undofile undolevels=10000 undoreload=100000
set splitbelow splitright
set autoindent smartindent
set hid noswapfile nowritebackup
set sidescroll=1 sidescrolloff=3 scrolloff=2
set wildmenu wildmode=longest,full
set incsearch nowrapscan ignorecase smartcase
set notimeout ttimeout timeoutlen=100 ttimeoutlen=0 updatetime=100
set backspace=indent,eol,start
set formatoptions-=tcro shortmess=atIAcFW
set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set lazyredraw
set textwidth=79 nowrap
set spellfile=~/.vim/spell/en.utf-8.add spelllang=en_gb
set foldmethod=marker
set laststatus=2 showtabline=0 noruler noshowmatch showcmd cursorline
set fillchars=stl:\ ,stlnc:\ ,vert:\|
set ve=all nostartofline nomore
set termguicolors
runtime macros/matchit.vim
set synmaxcol=200
set path=.,,
set viminfo='15,<50,s10,h
filetype plugin indent on

syntax enable
set background=dark
colorscheme nord

au CmdlineEnter [/\?] :set hlsearch
au CmdlineLeave [/\?] :set nohlsearch
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
