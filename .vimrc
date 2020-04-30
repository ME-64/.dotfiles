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
Plugin 'tpope/vim-repeat'
call vundle#end()
filetype plugin indent on

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
set ttyfast                          " fast term!
set incsearch                        " Incremental Searching
set nowritebackup                    " disable
set updatetime=100                   " quicker updating
set conceallevel=0                   " back to default
set modeline                         " use modelines
set backspace=indent,eol,start       " correct backspace
set ve=all                           " virtual editing
set formatoptions+=j                 " remove comments on line join
set formatoptions-=t                 " no auto wrap
set formatoptions-=cro               " no auto commenting
set shortmess=atIAc                  " no startup + auto comp message
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set lazyredraw                       " don't update screen during macro
set textwidth=100                    " 100 chars for wrapping

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
" THEME
" --------------------------------------------------------
set termguicolors          " Depends on setup for which to use
colorscheme default
set background=dark

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
" map <silent> <leader>e :Lex<CR>
nnoremap <leader>b :ls<cr>:b<space>
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


" sensical top & bottom
noremap gt gg
noremap gb G



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

" Run python files easily
autocmd FileType python nnoremap <buffer> <leader>r :!clear; python3 %<cr>

" Run nodejs easily
autocmd FileType javascript nnoremap <buffer> <leader>r :!clear; node %<cr>

" --------------------------------------------------------
" OTHER
" ------------------------------------------------------- 
" Return to same line from when file last opened
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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
" g: guides
" G: Goyo
" |: colour column
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

nnoremap <silent> <leader>t\ :call ToggleCC()<CR>

" --------------------------------------------------------
" Markdown Stuff
" -------------------------------------------------------- 
" augroup pandoc_syntax
"     au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
" augroup END
nnoremap <leader>mh1 yypv$r=
nnoremap <leader>mh2 yypv$r-
nnoremap <leader>mh3 ^i###<space><esc>
nnoremap <leader>mh4 ^i####<space><esc>
nnoremap <leader>mh5 ^i#####<space><esc>
nnoremap <leader>mh6 ^i######<space><esc>
nnoremap <leader>mc 0i```<CR><CR>```<esc>kka

autocmd FileType markdown :set formatoptions+=t

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
set statusline+=\ 
set statusline+=%=
set statusline+=%1*
set statusline+=\ 
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


" fixes slow insert mode leaving
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif


