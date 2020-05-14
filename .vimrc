" ==============================================================================
" Basic
" ==============================================================================
" {{{
set clipboard=unnamedplus            " Using system clipboard
set number relativenumber            " Line Numbers
set tabstop=4 softtabstop=4 shiftwidth=4 shiftround expandtab smarttab
set nowrap                           " Disabled by default, toggled on
set undodir=~/.vim/undodir undofile undolevels=10000 undoreload=100000           " Better undos
set splitbelow splitright            " Default split positions
set autoindent                       " Better indentation
set noswapfile nowritebackup         " Swaps bad, backups bad
set sidescroll=1 sidescrolloff=3 scrolloff=2
set wildmenu wildmode=full           " Autocomplete for cmd
set hid                              " Lets you open new files while unsaved changes
set ignorecase smartcase             " case insensitve search, unless you specify upper
set nottimeout notimeout             " cmd's dont timeout
set incsearch                        " Incremental Searching, with live sub
set updatetime=100                   " quicker updating
set conceallevel=0                   " back to default
set backspace=indent,eol,start       " correct backspace
set grepprg=rg\ --vimgrep            " use ripgrep for grepping
set formatoptions-=tcro              " no auto wrap, auto commeting
set shortmess=atIAcFW                " no startup + auto comp message
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set lazyredraw                       " don't update screen during macro
set textwidth=100                    " 100 chars for wrapping
set spelllang=en_gb                  " the queen's english
set spellfile=~/.vim/spell/en.utf-8.add
set foldmethod=indent                " simple folding
let g:python3_host_prog="/home/milo/.config/nvim/neo-venv/bin/python3" " save neovim some ms
set noshowmatch
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
Plug 'mbbill/undotree', {'on': ['UndotreeToggle']}                   " visualise undo history

" Colours
Plug 'fxn/vim-monochrome'                                            " more simple
" tpope goodness
Plug 'tpope/vim-surround'                                            " wow quotes
Plug 'tpope/vim-repeat'                                              " let . work for (some) plugins
Plug 'tpope/vim-commentary'                                          " gcc to comment and uncomment things

" helpers
Plug 'nathanaelkane/vim-indent-guides', {'on': ['IndentGuidesToggle']}
Plug 'dstein64/vim-startuptime', {'on': ['StartupTime']}             " debug startup time
Plug 'linluk/vim-websearch'                                          " google terms
Plug 'junegunn/vim-peekaboo'                                         " see register content

" Text Objects
Plug 'kana/vim-textobj-user'                                         " UD objects
Plug 'reedes/vim-textobj-sentence', {'for': ['markdown']}            " clever sentence objects
Plug 'michaeljsmith/vim-indent-object'                               " identation objects
Plug 'mattn/vim-textobj-url'                                         " url text obj
Plug 'glts/vim-textobj-comment'                                      " comments
Plug 'wellle/targets.vim'                                            " improve in-builts + more
" Plug 'whatyouhide/vim-textobj-xmlattr'                               " html tags
" Plug 'kana/vim-textobj-fold'                                         " folding

" Motions & navigation
    Plug 'rhysd/clever-f.vim'                                            " smart f/t movement
Plug 'junegunn/vim-easy-align'                                       " horizontal alignment of words

" Writing
Plug 'shime/vim-livedown', {'for': ['markdown']}                     " live preview of markdown

" Python stuff
Plug 'vim-python/python-syntax', {'for': ['python']}                 " Python syntax highlighting
Plug 'jeetsukumaran/vim-pythonsense', {'for': ['python']}            " objects for python
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']}            " better indent for python
Plug 'raimon49/requirements.txt.vim', {'for': ['requirements']}      " syntax highlight req.txt
" Plug 'chrisbra/csv.vim'                                              " nice csv viewing.

" General Language stuff
Plug 'majutsushi/tagbar', {'on': ['TagbarToggle']}                   " outline of file by class/function

call plug#end()
filetype plugin indent on
" }}}


" ==============================================================================
" THEME
" ==============================================================================
" {{{
set termguicolors
colorscheme oldbook
" colorscheme monochrome
" }}}


" ==============================================================================
"  BINDINGS
" ==============================================================================
" {{{
" Leader remap
nnoremap <SPACE> <Nop>

let mapleader = " "
" Inserting new lines without leaving normal mode
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

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

" useful buffer switching
nnoremap <silent> = :bn <cr>
nnoremap <silent> - :bp <cr>
nnoremap <silent> _ :bd <cr>
" nnoremap <silent> _ :b#<bar>bd#<CR>

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

nnoremap <silent> <leader>ts :set spell!<CR>
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
nnoremap <leader>tp :setlocal invpaste paste?<CR> <bar>:set paste?<CR>
nnoremap <silent> <leader>t\ :call ToggleCC()<CR>

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

" }}}


" ==============================================================================
" Python
" ==============================================================================
" {{{
let g:is_pythonsense_suppress_object_keymaps = 1
let g:is_pythonsense_suppress_motion_keymaps = 1
let g:is_pythonsense_suppress_location_keymaps = 1
let g:python_highlight_all = 1
" Run python files easily
au FileType python nnoremap <buffer> <leader>rf :!python3 %<CR>
" Run doctests
au FileType python nnoremap <buffer> <leader>rt :!pytest --doctest-modules %<CR>
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
" }}}


" ==============================================================================
" scss/sass Stuff
" ==============================================================================
" {{{
autocmd FileType scss set iskeyword+=-
" }}}

" ==============================================================================
" Markdown Stuff
" ==============================================================================
" {{{
let g:markdown_fenced_languages=['html', 'css', 'javascript', 'python', 'js=javascript', 'py=python']
let g:markdown_minlines = 100
let g:markdown_folding=1
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

fun! s:MarkdownStuff()
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
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
let g:fzf_preview_windows=''

" function! FloatingFZF()
"     let buf = nvim_create_buf(v:false, v:true)
"     call setbufvar(buf, '&signcolumn', 'no')

"     let height = float2nr(20)
"     let width = float2nr(100)
"     let horizontal = float2nr((&columns - width) / 2)
"     let vertical = 10

"     let opts = {
"                 \ 'relative': 'editor',
"                 \ 'row': vertical,
"                 \ 'col': horizontal,
"                 \ 'width': width,
"                 \ 'height': height,
"                 \ 'style': 'minimal'
"                 \ }
"     call nvim_open_win(buf, v:true, opts)
" endfunction

let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit' }
"  \ 'ctrl-t': 'tab split',


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

omap az [zV]z
xmap az [zoV]z


" Code block (triple back-tick) object with <Shift-`>
xnoremap <silent> i¬ g_?^\s*```<cr>jo/^\s*```<cr>kV:<c-u>nohl<cr>gv
xnoremap <silent> a¬ g_?^\s*```<cr>o/^\s*```<cr>V:<c-u>nohl<cr>gv
onoremap <silent> i¬ :<C-U>execute "normal vi~"<cr>
onoremap <silent> a¬ :<C-U>execute "normal va~"<cr>

" limit targets to the current line only
" unintended consequences so removed
" let g:targets_seekRanges = 'cc cr cb cB lc lr rr ll lb lB rb rB'

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

" Easy shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" no signcolumn for special windows
au FileType nerdtree setlocal signcolumn="no"
au FileType tagbar setlocal signcolumn="no"
au FileType undotree setlocal signcolumn="no"

syntax enable " At the end to ensure it's enabled once all themeing is done

" only highlight while search is in progress
augroup vimrc-incsearch-highlight
    au!
    au CmdlineEnter [/\?] :set hlsearch
    au CmdlineLeave [/\?] :set nohlsearch
augroup END
" }}}


" ==============================================================================
" Hacks :(
" ==============================================================================
" {{{

" need to figure out what is overwriting it...
" au BufEnter * set formatoptions-=cro
" }}}


" ==============================================================================
" Disable in-built plugins
" ==============================================================================
" {{{
let g:loaded_getscriptPlugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1
let g:loaded_gzip = 1
let g:loaded_rrhelper = 1
" }}}
