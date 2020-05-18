" Basics {{{
set clipboard=unnamedplus
set number relativenumber
set tabstop=4 softtabstop=4 shiftwidth=4 shiftround expandtab smarttab
set undodir=~/.vim/undodir undofile undolevels=10000 undoreload=100000
set splitbelow splitright
set autoindent smartindent
set hid noswapfile nowritebackup
set sidescroll=1 sidescrolloff=3 scrolloff=2
set wildmenu wildmode=longest,full
set incsearch ignorecase smartcase
set notimeout ttimeout timeoutlen=100 ttimeoutlen=0 updatetime=100
set backspace=indent,eol,start
set formatoptions-=tcro
set shortmess=atIAcFW
set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set lazyredraw
set textwidth=80 nowrap
set spellfile=~/.vim/spell/en.utf-8.add spelllang=en_gb
set foldmethod=indent
set laststatus=0 statusline=%#Normal# showtabline=0 noruler noshowmatch showcmd
set fillchars=stl:−,stlnc:−,vert:\|
set ve=all
set termguicolors
runtime matchit
" }}}

" PLUGINS {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" File Navigation
Plug 'junegunn/fzf',  {'dir': '~/.fzf', 'do': './install --bin'} | Plug 'junegunn/fzf.vim'
" Plug 'hardselius/warlock'
Plug 'sainnhe/gruvbox-material'
" Custom Nouns
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-sentence', {'for': ['markdown']}
Plug 'michaeljsmith/vim-indent-object'
Plug 'mattn/vim-textobj-url'
Plug 'kana/vim-textobj-fold'
Plug 'glts/vim-textobj-comment'
Plug 'wellle/targets.vim'
" Custom Verbs
Plug 'kana/vim-operator-user'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'habamax/vim-sendtoterm'
Plug 'junegunn/vim-easy-align'
" Helpers
Plug 'rhysd/clever-f.vim'
Plug 'dstein64/vim-startuptime', {'on': ['StartupTime']}
Plug 'tpope/vim-repeat'
" Python stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax', {'for': ['python']}
Plug 'jeetsukumaran/vim-pythonsense', {'for': ['python']}
Plug 'Vimjas/vim-python-pep8-indent', {'for': ['python']}
" Poppy things
Plug 'majutsushi/tagbar', {'on': ['TagbarToggle']}
Plug 'junegunn/vim-peekaboo'
Plug 'mbbill/undotree', {'on': ['UndotreeToggle']}
call plug#end()
filetype plugin indent on
" }}}

" BINDINGS {{{
" Leader remap
nnoremap <SPACE> <Nop>
let mapleader = " "
" Inserting new lines without leaving normal mode
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>
" Save files when you forgot to sudo into it
cmap w!! w !sudo tee > /dev/null %
" Better saving
nmap <leader>w ;w<cr>
" Better quitting
nmap <leader>q ;qall<cr>
nmap Q <Nop>
" rebinds semi-colon to toggle full cmd window
noremap ; :
noremap : q:
au CmdwinEnter * noremap <buffer> : :q<CR>
au CmdwinEnter * noremap <buffer> <esc> :q<CR>

" correct y
noremap Y y$
" join and split lines intuitively
nnoremap <c-h> 0i<BS><esc>
nnoremap <c-l> i<cr><esc>kj$
" Better navigation
noremap <C-k> <C-u><C-u>
noremap <C-j> <C-d><C-d>
noremap J <c-d>
noremap K <c-u>
noremap H ^
noremap L $
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
" Change text without putting the text into register
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc
" make slightly more informative
nnoremap <C-g> 1<c-g>
" switch between buffers
nnoremap <bs> <c-^>
" No Arrow keys!
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
nnoremap <C-w>q <C-w>c
nnoremap <C-w><C-q> <C-w>c
" pre/append to all lines in block w/same indent
nmap <silent> <leader>I ^vii<C-V>I
nmap <silent> <leader>A ^vii<C-V>$A
" consistent next and prev in command mode
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>
nnoremap <silent> <leader>ts :set spell!<CR>
" open in firefox, netrw
nmap go gx
vmap go gx
vnoremap gO "gy<Esc>:call GoogleSearch()<CR>
function! GoogleSearch()
    let searchterm = getreg("g")
    silent! exec "silent! !firefox \"http://google.com/search?q=" . searchterm . "\" &"
    redraw!
endfunction

" close all other folds, open only current
nnoremap zZ zMzazz

" nuking buffers
command BDO :%bd|e#|bd#
cnoreabbrev bon BDO
command BDA :%bd
cnoreabbrev bda BDA

" }}}

" Clever F settings {{{
let g:clever_f_across_no_line=1
let g:clever_f_ignore_case=1
let g:clever_f_smart_case=1
let g:clver_f_fix_key_direction=1
" }}}

" Formatting Stuff {{{
function! RemoveTrailingWhitespace()
    for lineno in range(a:firstline, a:lastline)
        let line = getline(lineno)
        let cleanLine = substitute(line, '\(\s\| \)\+$', '', 'e')
        call setline(lineno, cleanLine)
    endfor
endfunction

command! -range RT  :<line1>,<line2>call RemoveTrailingWhitespace()
command -range=% RDB :<line1>,<line2>g/^$/,/./-j
command -range=% RB :<line1>,<line2>g/^\s*$/d

map <silent> grdb <Plug>(operator-RDB)
call operator#user#define_ex_command('RDB', 'RDB')
map <silent> grb <Plug>(operator-RB)
call operator#user#define_ex_command('RB', 'RB')
map <silent> grt <Plug>(operator-RT)
call operator#user#define_ex_command('RT', 'RT')
" }}}

" Python Stuff {{{
let g:is_pythonsense_suppress_object_keymaps = 1
let g:is_pythonsense_suppress_motion_keymaps = 1
let g:is_pythonsense_suppress_location_keymaps = 1
let g:python_highlight_all = 1
" running various tools
au FileType python nnoremap <buffer> <leader>rf :w !python3 %<CR>
au FileType python nnoremap <buffer> <leader>rt :w !pytest --doctest-modules %<CR>
au FileType python nnoremap <buffer> <leader>rl :w !pylint -f parseable -r n -s n -E %<CR>
au FileType python nnoremap <buffer> <leader>rs :w !mypy %<CR>
au FileType python inoreabbr ipdb import<space>pdb;<space>pdb.set_trace();<BS>
au FileType python setlocal nofoldenable

" coc
let g:coc_global_extensions = ['coc-python', 'coc-json']
inoremap <expr> <C-j> pumvisible() ? '<C-n>' : '<Nop>'
inoremap <expr> <C-k> pumvisible() ? '<C-p>' : '<Nop>'
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gD :call <SID>show_documentation()<CR>
nmap <F2> <Plug>(coc-rename)

vmap gy <Plug>(coc-format-selected)
nmap gy <Plug>(coc-format-selected)

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

call coc#config('diagnostic', {
            \ 'enableSign': 0,
            \ 'checkCurrentLine': 1,
            \ })
call coc#config('suggest', {'floatEnable': 0})
call coc#config('python', {'jediEnabled': 0})
call coc#config('coc.preferences', {'useQuickfixForLocations': 1})
" }}}

" Web Stuff {{{
" treat all htmldjangofiles as html (for ftplugins)
au FileType htmldjango set filetype=html
au FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
au FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
au FileType javascript nnoremap <buffer> <leader>jc ^iconsole.log(<esc>A);<esc>
au FileType javascript vnoremap <buffer> <leader>jc diconsole.log(<esc>p`]li);<esc>
autocmd FileType scss set iskeyword+=-
" }}}

" Markdown Stuff {{{
let g:markdown_fenced_languages=['html', 'css', 'javascript', 'python', 'js=javascript', 'py=python']
let g:markdown_minlines = 100
let g:markdown_folding=1
au BufNewFile,BufFilePre,BufRead *.md set ft=markdown

" easy insert of Numbered list
command! -range=% -nargs=1 NL
  \ <line1>,<line2>!nl -w <args> -s '. ' | perl -pe 's/^.{<args>}..$//'


fun! s:MarkdownStuff()
    vmap <leader>fT :EasyAlign*<Bar><CR>
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
    au FileType markdown setlocal formatoptions+=t sw=2 sts=2 et tw=80
    au FileType markdown call textobj#sentence#init()
    au FileType markdown vnoremap <leader>mn :NL1<CR>
augroup END

" }}}

" fzf options {{{
let g:fzf_colors =
            \ {'fg':     ['fg', 'Normal'],'bg':                      ['bg', 'Normal'],
            \  'hl':     ['fg', 'Comment'],'fg+':                    ['fg', 'Label'],
            \  'bg+':    ['bg', 'CursorLine', 'CursorColumn'],'hl+': ['fg', 'Statement'],
            \  'info':   ['fg', 'PreProc'],'border':                 ['fg', 'Ignore'],
            \  'prompt': ['fg', 'Conditional'],'pointer':            ['fg', 'Exception'],
            \  'marker': ['fg', 'Keyword'],'spinner':                ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \  'header': ['fg', 'Comment'] }

let $FZF_DEFAULT_COMMAND="fdfind --type f -H"
let $FZF_DEFAULT_OPTS="--layout=reverse"
let g:fzf_layout= {'window': {'width': 0.9, 'height': 0.6}}
let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit',
            \ 'ctrl-t': 'tab split'}

nnoremap <leader>f :Files ~/<CR>
nnoremap <leader>b :ls<CR>:b<space>
nnoremap <leader>g :GFiles<CR>
nnoremap <C-f>b :Buffers<CR>
nnoremap <C-f>l :BLines<CR>
nnoremap <C-f>L :Lines<CR>
nnoremap <C-f>h :Help<CR>
nnoremap <C-f>d :call fzf#run(fzf#wrap({'source': 'fdfind --type d . ~/', 'sink': 'cd'}))<CR>
" }}}

" Text Object mappings {{{
" if/af - functions, aC/iC - class, ai/ii - indent, au/iu - urls, ac/ic - comments, iz, az - fold
omap aC <Plug>(PythonsenseOuterClassTextObject)
omap iC <Plug>(PythonsenseInnerClassTextObject)
omap af <Plug>(PythonsenseOuterFunctionTextObject)
omap if <Plug>(PythonsenseInnerFunctionTextObject)

vmap aC <Plug>(PythonsenseOuterClassTextObject)
vmap iC <Plug>(PythonsenseInnerClassTextObject)
vmap af <Plug>(PythonsenseOuterFunctionTextObject)
vmap if <Plug>(PythonsenseInnerFunctionTextObject)

vmap aD <Plug>(PythonsenseOuterDocStringTextObject)
vmap iD <Plug>(PythonsenseInnerDocStringTextObject)
omap aD <Plug>(PythonsenseOuterDocStringTextObject)
omap iD <Plug>(PythonsenseInnerDocStringTextObject)

"line text objects
xnoremap il g_o^
onoremap il :<C-u>normal vil<CR>
xnoremap al $o0
onoremap al :<C-u>normal val<CR>

" align things
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" entire document
xnoremap ad <esc>vggoVG
onoremap ad :<C-u>normal vad<CR>

" rectangular
xmap ir i[
xmap ar a[
omap ir :normal vi[<CR>
omap ar :normal va[<CR>

" remapping vim-surround to follow the "g" verb convention
nmap gs ys
vmap gs S

" Code block (triple back-tick) object with <Shift-`>
xnoremap <silent> i¬ g_?^\s*```<cr>jo/^\s*```<cr>kV:<c-u>nohl<cr>gv
xnoremap <silent> a¬ g_?^\s*```<cr>o/^\s*```<cr>V:<c-u>nohl<cr>gv
onoremap <silent> i¬ :<C-U>execute "normal vi~"<cr>
onoremap <silent> a¬ :<C-U>execute "normal va~"<cr>
" }}}

" Poppy Stuff {{{
nmap <leader>T ;TagbarToggle<CR>
let g:tagbar_auto_close=1
let g:tagbar_autofocus=1
let g:tagbar_sort=0 " sort by location
let g:tagbar_compact=1
let g:tagbar_indent=1
let g:tagbar_show_linenumbers=1

nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_WindowLayout=4
let g:undotree_SplitWidth=40
let g:undotree_SetFocusWhenToggle=1
let g:undotree_ShortIndicators=1
" }}}

" Easy directory switching {{{
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

nnoremap cdb :cd %:p:h<CR>:pwd<CR>
nnoremap cdh :cd ~/<CR>:pwd<CR>
nnoremap cdg :Root<CR>
" }}}

" Vim Terminal {{{
nmap gtt <Plug>(SendToTermLine)
nmap gt <Plug>(SendToTerm)
omap gt <Plug>(SendToTerm)
vmap gt <Plug>(SendToTerm)

" don't show trailing whitespace on cmdline
au TerminalOpen * if &buftype == 'terminal' | setlocal nolist | endif

" sensical escape
tnoremap <F1> <C-W>N

cnoreabbrev ipy ipython --no-autoindent --pprint --colors='NoColor' --nosep --no-banner
cnoreabbrev +c ++close
cnoreabbrev ipt terminal ++close ipython --no-autoindent --pprint --colors='NoColor' --nosep --no-banner
cnoreabbrev vsb vert sb
set shell=zsh
" }}}

" Netrw {{{
" placeholder
let g:netrw_bufsettings="noma nomod nowrap ro nobl nocursorcolumn nocursorline"
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=0
let g:netrw_cursor=4
let g:netrw_sort_by="exten"
let g:netrw_fastbrowse=0
let g:netrw_altfile=1
cnoreabbrev lex 20Lex
cnoreabbrev ex Explore
autocmd FileType netrw setl bufhidden=wipe
autocmd FileType netrw nnoremap <buffer> cdh :Ntree /home/milo<CR>
autocmd FileType netrw nnoremap <buffer> cdb :execute 'Ntree' expand('%:p:h')<CR>
" }}}

" OTHER {{{
" Return to same line from when file last opened
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" diable paste when exit insert mode
au InsertLeave * silent! set nopaste

" folding
" set foldlevelstart=99
au FileType vim set foldmethod=marker

" Easy shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" colorscheme warlock
let g:gruvbox_material_background='soft'
let g:gruvbox_material_enable_bold=1
set background=dark
colorscheme gruvbox-material
syntax enable
" hi CursorLine guibg=#262626
" hi CursorLineNr guibg=#262626
" hi LineNr guibg=#303030
" hi LineNr guibg=#303030
" hi FoldColumn guibg=#303030
" hi Folded guibg=#303030

autocmd VimResized * :wincmd =

" only highlight while search is in progress
augroup vimrc-incsearch-highlight
    au!
    au CmdlineEnter [/\?] :set hlsearch
    au CmdlineLeave [/\?] :set nohlsearch
augroup END
" }}}

" Hacks {{{

" Some filetypes override this grr
au BufEnter * set formatoptions-=cro
let g:loaded_getscriptPlugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1
let g:loaded_gzip = 1
let g:loaded_rrhelper = 1
" }}}

