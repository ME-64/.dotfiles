" --------------------------------------------------------
"  Basic
" -------------------------------------------------------- 
set clipboard=unnamedplus            " Using system clipboard
set nocompatible                     " Not comaptible with Vi
filetype off                         " Needed for Vundle
set number relativenumber            " Line Numbers
set expandtab                        " Convert Tabs to spaces
set tabstop=2                        " Default tab for files
set softtabstop=2                    " Defualt tabs for files
set shiftwidth=2                     " Default tabs for files
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
set incsearch                        " Incremental Searching
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
command! MakeTags !ctags -R .        



" --------------------------------------------------------
"  PLUGINS - NEED Vundle Installed 
" --------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'                             " file browser
Plugin 'ryanoasis/vim-devicons'                          " Icons for NERDTree
Plugin 'tpope/vim-commentary'                            " gcc to comment and uncomment things
Plugin 'morhetz/gruvbox'                                 " Gruvbox theme
Plugin 'vim-airline/vim-airline'                         " Simple Status line
Plugin 'vim-airline/vim-airline-themes'                  " Simple Status line
Plugin 'machakann/vim-highlightedyank'                   " Highlight text that has been yanked
Plugin 'junegunn/goyo.vim'                               " Distraction free mode
Plugin 'vim-python/python-syntax'                        " Python syntax highlighting
Plugin 'jpalardy/vim-slime'                              " vim REPL support
Plugin 'tpope/vim-fugitive'                              " git integration
Plugin 'tpope/vim-surround'                              " easy quotes
Plugin 'tpope/vim-unimpaired'                            " good toggle mappings
Plugin 'tpope/vim-repeat'                                " let . work for plugins
Plugin 'easymotion/vim-easymotion'                       " good navigation, sometimes
Plugin 'gcmt/taboo.vim'                                  " rename tabs

Plugin 'vim-pandoc/vim-pandoc-syntax'                    " markdown syntax

" Code completion
Plugin 'neoclide/coc.nvim', {'branch': 'release'}        " code completion

call vundle#end()
filetype plugin indent on 


" --------------------------------------------------------
" THEME
" -------------------------------------------------------- 
"set t_Co=256              " Depends on setup for which to use
set termguicolors        " Depends on setup for which to use
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_color_column="bg1"
let g:gruxbox_number_column="bg1"
let g:gruvbox_bold=0
let g:gruvbox_invert_selection=0

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
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
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
" Yank Stuff
" -------------------------------------------------------- 
let g:highlightedyank_highlight_duration=5000


" --------------------------------------------------------
" Distraction Free Mode
" -------------------------------------------------------- 
nmap <leader>g :Goyo<CR>


" --------------------------------------------------------
" Vim Unimpaired Stuff
" -------------------------------------------------------- 
" yoh - Highlight Search
" yoc - cursorline
" you - cursor column
" yon, yor - line numbers
" yow - wrap
" yos - spelling
" yop - pasting!


" --------------------------------------------------------
" Taboo Stuff
" -------------------------------------------------------- 
set guioptions-=e                  " tabs look same in gui


" --------------------------------------------------------
" Markdown Stuff
" -------------------------------------------------------- 
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

" --------------------------------------------------------
" Auto Complete Stuff
" -------------------------------------------------------- 
let g:coc_global_extensions = ['coc-python', 'coc-html', 'coc-css', 'coc-vimlsp']
set signcolumn=yes            " always show sign column
set shortmess+=c              " no messages in cmd

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" --------------------------------------------------------
" Devicons Stuff
" -------------------------------------------------------- 
let g:webdevicons_conceal_nerdtree_brackets=1

 
" --------------------------------------------------------
" Vim Slime Stuff
" -------------------------------------------------------- 
let g:slime_target="tmux"
let g:slime_paste_file="$HOME/.slime_paste"
let g:slime_no_mappings=1
let g:slime_python_ipython=1

"let g:slime_target="vimterminal"

xmap <leader><cr> :SlimeSend<cr>i<esc>
nmap <leader><cr> :SlimeSend<cr>i<esc>
nmap <leader>0 <Plug>SlimeConfig

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

" --------------------------------------------------------
" Easy Motion Stuff
" -------------------------------------------------------- 

" --------------------------------------------------------
" Neovim Cursor Stuff
" -------------------------------------------------------- 
" set guicursor= 
" set guicursor+=i:ver100
" set guicursor+=n-v-c:block


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
map <silent> <leader>e :NERDTreeToggle<CR>



" --------------------------------------------------------
" No Arrow keys!
" -------------------------------------------------------- 
" Command Mode
"cnoremap <Down> <Nop> 
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
"cnoremap <Up> <Nop>

" Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>


" --------------------------------------------------------
" Python Stuff
" -------------------------------------------------------- 
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4
"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4
" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
autocmd FileType python nnoremap <buffer> <leader>r :!clear; python3 %<cr>


" --------------------------------------------------------
" OTHER
" -------------------------------------------------------- 
" Return to same line from when file last opened
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

syntax enable " At the end to ensure it's enabled once all themeing is done
let g:python_highlight_all = 1
