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
set formatoptions-=tcro shortmess=atIAcFW
set list listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set lazyredraw
set textwidth=80 nowrap
set spellfile=~/.vim/spell/en.utf-8.add spelllang=en_gb
set foldmethod=indent
set laststatus=2 showtabline=0 noruler noshowmatch showcmd noshowmode
" statusline=%#Normal#
" showtabline=0
set fillchars=stl:\ ,stlnc:\ ,vert:\|
set ve=all
set termguicolors
runtime macros/matchit.vim
set path=.,,
set tags=./tags;,tags; " need to look for standard library tags
" }}}

" PLUGINS {{{
call plug#begin('~/.vim/plugged')
" File Navigation
    Plug 'junegunn/fzf',  {'dir': '~/.fzf', 'do': './install --bin'} | Plug 'junegunn/fzf.vim'
    Plug 'sainnhe/gruvbox-material'
" Custom Nouns
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-sentence', {'for': ['markdown']}
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

Plug 'ThePrimeagen/vim-be-good'
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
cmap W!! w !sudo tee > /dev/null %
" Better saving
nnoremap <leader>w :w<cr>
" Better quitting
nnoremap <leader>q :qall<cr>
nmap Q <Nop>
" rebinds semi-colon to toggle full cmd window
noremap ; :
noremap : q:
au CmdwinEnter * noremap <buffer> : :q<CR>
au CmdwinEnter * noremap <buffer> <esc> :q<CR>

" correct y
noremap Y y$
" join and split lines 'intuitively'
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
" consistent window closing
nnoremap <C-w>q <C-w>c
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

nnoremap <leader>l :w !ls<CR>:

" }}}

" Abbreviations {{{
" nuking buffers
command BDO :%bd|e#|bd#
cnoreabbrev bon BDO
command BDA :%bd
cnoreabbrev bda BDA
" terminal
cnoreabbrev ipy ipython --no-autoindent --pprint --colors='NoColor' --nosep --no-banner
" cnoreabbrev +c ++close
cnoreabbrev ipt terminal ++close ipython --no-autoindent --pprint --colors='NoColor' --nosep --no-banner
cnoreabbrev vsb vert sb
" }}}

" Status Line {{{
set statusline=
set statusline+=%<\ %{StatuslineMode()}\ %t\ %m%r%w%=[%{getcwd()}]\ Line:\ \%l\/\%L\ Col:\ \%c\ 
function! StatuslineMode()
  let l:mode=mode()
  if l:mode==#"n"
    return "N"
  elseif l:mode==?"v"
    return "V"
  elseif l:mode==#"i"
    return "I"
  elseif l:mode==#"R"
    return "R"
  elseif l:mode==?"s"
    return "S"
  elseif l:mode==#"t"
    return "T"
  elseif l:mode==#"c"
    return "C"
  elseif l:mode==#"!"
    return "S"
  endif
endfunction
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

command! -range    RT  :<line1>,<line2>call RemoveTrailingWhitespace()
command! -range=%  RDB :<line1>,<line2>g/^$/,/./-j
command! -range=%  RB  :<line1>,<line2>g/^\s*$/d

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

" completion options
set completeopt=menu,menuone,popup,noinsert,noselect

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

function! s:MarkdownStuff()
    vmap <leader>fT :EasyAlign*<Bar><CR>
    nnoremap <leader>mh1 :s/^#* //ge<CR>^i#<space><esc>0
    nnoremap <leader>mh2 :s/^#* //ge<CR>^i##<space><esc>0
    nnoremap <leader>mh3 :s/^#* //ge<CR>^i###<space><esc>0
    nnoremap <leader>mh4 :s/^#* //ge<CR>^i####<space><esc>0
    nnoremap <leader>mh5 :s/^#* //ge<CR>^i#####<space><esc>0
    nnoremap <leader>mh6 :s/^#* //ge<CR>^i######<space><esc>0
    nnoremap <leader>mhc :s/^#* //ge<CR>0
    nnoremap <leader>mc 0i```<CR><CR>```<esc>kka
endfunction

augroup MarkdownSetup
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
let $FZF_DEFAULT_OPTS="--layout=reverse --preview=''"
let g:fzf_preview_window=''
let g:fzf_layout= {'down': '~20%'}
let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit',
            \ 'ctrl-t': 'tab split'}

nnoremap <silent> <leader>f :Files ~/<CR>
nnoremap <leader>b :ls<CR>:
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <C-f>b :Buffers<CR>
nnoremap <silent> <C-f>l :BLines<CR>
nnoremap <silent> <C-f>L :Lines<CR>
nnoremap <silent> <C-f>h :Help<CR>
nnoremap <silent> <C-f>d :call fzf#run(fzf#wrap({'source': 'fdfind --type d . ~/', 'sink': 'cd'}))<CR>
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
onoremap ir :normal vi[<CR>
onoremap ar :normal va[<CR>

" remapping vim-surround to follow the 'g' verb convention
nmap gs ys
vmap gs S

" Code block (triple back-tick) object with <Shift-`>
xnoremap <silent> i¬ g_?^\s*```<cr>jo/^\s*```<cr>kV:<c-u>nohl<cr>gv
xnoremap <silent> a¬ g_?^\s*```<cr>o/^\s*```<cr>V:<c-u>nohl<cr>gv
onoremap <silent> i¬ :<C-U>execute "normal vi~"<cr>
onoremap <silent> a¬ :<C-U>execute "normal va~"<cr>

" fold text object
vnoremap az :<C-U>silent! normal! [zV]z<CR>
onoremap az :normal Vaz<CR>
vnoremap iz :<C-U>silent! normal! [zjVo]zk<CR>
onoremap iz :normal Viz<CR>

" indentation
onoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR>
onoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR><Esc>gv

function! s:IndTxtObj(inner)
    let curline = line(".")
    let lastline = line("$")
    let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
    let i = i < 0 ? 0 : i
    if getline(".") =~ "^\\s*$"
        return
    endif
    let p = line(".") - 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p > 0 && (nextblank || indent(p) >= i )
        -
        let p = line(".") - 1
        let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    if (!a:inner)
        -
    endif
    normal! 0V
    call cursor(curline, 0)
    let p = line(".") + 1
    let nextblank = getline(p) =~ "^\\s*$"
    while p <= lastline && (nextblank || indent(p) >= i )
        +
        let p = line(".") + 1
        let nextblank = getline(p) =~ "^\\s*$"
    endwhile
    if (!a:inner)
        +
    endif
    normal! $
endfunction


let s:regex = '\c\<\(\%([a-z][0-9A-Za-z_-]\+:\%(\/\{1,3}\|[a-z0-9%]\)\|www\d\'
let s:regex.='{0,3}[.]\|[a-z0-9.\-]\+[.][a-z]\{2,4}\/\)\%([^ \t()<>]\+\|(\([^'
let s:regex.='\t()<>]\+\|\(([^ \t()<>]\+)\)\)*)\)\+\%((\([^ \t()<>]\+\|\(([^ '
let s:regex.='\t()<>]\+)\)\)*)\|[^ \t`!()[\]{};:'."'".'".,<>?«»“”‘’]\)\)'

call textobj#user#plugin('url', {
            \      '-': {
            \       'pattern': s:regex,
            \       'select': ['au', 'iu'],
            \      },
            \    })

let s:regNums = [ '0b[01]', '0x\x', '\d' ]

function! s:inNumber()
    let l:magic = &magic
    set magic
    let l:lineNr = line('.')
    let l:pat = join(s:regNums, '\+\|') . '\+'
    if (!search(l:pat, 'ce', l:lineNr))
        return
    endif
    normal! v
    call search(l:pat, 'cb', l:lineNr)
    let &magic = l:magic
endfunction

function! s:aroundNumber()
    let l:magic = &magic
    set magic
    let l:lineNr = line('.')
    let l:pat = join(s:regNums, '\+\|') . '\+'
    if (!search(l:pat, 'ce', l:lineNr))
        return
    endif
    call search('\%'.(virtcol('.')+1).'v\s*', 'ce', l:lineNr)
    normal! v
    call search(l:pat, 'cb', l:lineNr)
    call search('\s*\%'.virtcol('.').'v', 'b', l:lineNr)
    let &magic = l:magic
endfunction

" Numbers
xnoremap <silent> aN :<c-u>call <sid>aroundNumber()<cr>
onoremap <silent> aN :<c-u>call <sid>aroundNumber()<cr>
xnoremap <silent> iN :<c-u>call <sid>inNumber()<cr>
onoremap <silent> iN :<c-u>call <sid>inNumber()<cr>

" }}}

" Poppy Stuff {{{
nnoremap <leader>T :TagbarToggle<CR>
let g:tagbar_auto_close=1
let g:tagbar_autofocus=1
let g:tagbar_sort=0
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
" set shell=zsh
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
cabbrev lex 20Lex
cnoreabbrev ex Explore
autocmd FileType netrw setlocal bufhidden=wipe
autocmd FileType netrw nmap <buffer> <silent> <nowait> = <Plug>NetrwTreeSqueeze
" }}}

" OTHER {{{
" Return to same line from when file last opened
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif
" see difference between current buffer and the file opened initially
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" diable paste when exit insert mode
au InsertLeave * silent! set nopaste

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat^=%f:%l:%c:%m
endif

" auto open quickfix when errors
augroup autoquickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
augroup END

" folding
" set foldlevelstart=99
au FileType vim set foldmethod=marker

" Easy shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

let g:gruvbox_material_background='soft'
let g:gruvbox_material_enable_bold=1
colorscheme gruvbox-material
syntax enable
set background=dark

autocmd VimResized * :wincmd =

" only highlight while search is in progress
augroup vimrc-incsearch-highlight
    au!
    au CmdlineEnter [/\?] :set hlsearch
    au CmdlineLeave [/\?] :set nohlsearch
augroup END

" visual */#
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" insert current line into cmd
if !has('patch-8.0.1787')
    cnoremap <C-r><C-l> <C-r>=getline('.')<CR>
endif

" command line usability
" function! CCR()
"     let cmdline = getcmdline()
"     if cmdline =~ '\v\C^(ls|files|buffers)'
"         " like :ls but prompts for a buffer command
"         return "\<CR>:b"
"     elseif cmdline =~ '\v\C/(#|nu|num|numb|numbe|number)$'
"         " like :g//# but prompts for a command
"         return "\<CR>:"
"     elseif cmdline =~ '\v\C^(dli|il)'
"         " like :dlist or :ilist but prompts for a count for :djump or :ijump
"         return "\<CR>:" . cmdline[0] . "j  " . split(cmdline, " ")[1] . "\<S-Left>\<Left>"
"     elseif cmdline =~ '\v\C^(cli|lli)'
"         " like :clist or :llist but prompts for an error/location number
"         return "\<CR>:sil " . repeat(cmdline[0], 2) . "\<Space>"
"     elseif cmdline =~ '\C^old'
"         " like :oldfiles but prompts for an old file to edit
"         set nomore
"         return "\<CR>:sil se more|e #<"
"     elseif cmdline =~ '\C^changes'
"         " like :changes but prompts for a change to jump to
"         set nomore
"         return "\<CR>:sil se more|norm! g;\<S-Left>"
"     elseif cmdline =~ '\C^ju'
"         " like :jumps but prompts for a position to jump to
"         set nomore
"         return "\<CR>:sil se more|norm! \<C-o>\<S-Left>"
"     elseif cmdline =~ '\C^marks'
"         " like :marks but prompts for a mark to jump to
"         return "\<CR>:norm! `"
"     elseif cmdline =~ '\C^undol'
"         " like :undolist but prompts for a change to undo
"         return "\<CR>:u "
"     else
"         return "\<CR>"
"     endif
" endfunction
" cnoremap <expr> <CR> CCR()


" }}}

" Hacks {{{

" overrwrite default vim syntax file
au FileType vim set formatoptions-=cro
let g:loaded_getscriptPlugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1
let g:loaded_gzip = 1
let g:loaded_rrhelper = 1
" }}}

" tabline {{{
" https://github.com/ap/vim-buftabline/blob/master/plugin/buftabline.vim
hi default link BufTabLineCurrent TabLineSel
hi default link BufTabLineActive  PmenuSel
hi default link BufTabLineHidden  TabLine
" hi default link BufTabLineFill    VertSplit
" hi TabLineFill guibg=#504945
hi TabLineFill guibg=NONE

let g:buftabline_numbers    = get(g:, 'buftabline_numbers',    1)
let g:buftabline_indicators = get(g:, 'buftabline_indicators', 0)
let g:buftabline_separators = get(g:, 'buftabline_separators', 0)
let g:buftabline_show       = get(g:, 'buftabline_show',       2)
let g:buftabline_plug_max   = get(g:, 'buftabline_plug_max',  10)

function! UserBuffers() " help buffers are always unlisted, but quickfix buffers are not
    return filter(range(1,bufnr('$')),'buflisted(v:val) && "quickfix" !=? getbufvar(v:val, "&buftype")')
endfunction

let s:dirsep = fnamemodify(getcwd(),':p')[-1:]
let s:centerbuf = winbufnr(0)
function! Render()
    let show_num = g:buftabline_numbers == 1
    let show_ord = g:buftabline_numbers == 2
    let show_mod = g:buftabline_indicators
    let lpad     = g:buftabline_separators ? nr2char(0x23B8) : ' '

    let bufnums = UserBuffers()
    let centerbuf = s:centerbuf " prevent tabline jumping around when non-user buffer current (e.g. help)

    " pick up data on all the buffers
    let tabs = []
    let path_tabs = []
    let tabs_per_tail = {}
    let currentbuf = winbufnr(0)
    let screen_num = 0
    for bufnum in bufnums
        let screen_num = show_num ? bufnum : show_ord ? screen_num + 1 : ''
        let tab = { 'num': bufnum }
        let tab.hilite = currentbuf == bufnum ? 'Current' : bufwinnr(bufnum) > 0 ? 'Active' : 'Hidden'
        if currentbuf == bufnum | let [centerbuf, s:centerbuf] = [bufnum, bufnum] | endif
        let bufpath = bufname(bufnum)
        if strlen(bufpath)
            let tab.path = fnamemodify(bufpath, ':p:~:.')
            let tab.sep = strridx(tab.path, s:dirsep, strlen(tab.path) - 2) " keep trailing dirsep
            let tab.label = tab.path[tab.sep + 1:]
            let pre = ( show_mod && getbufvar(bufnum, '&mod') ? '+' : '' ) . screen_num
            let tab.pre = strlen(pre) ? pre . ' ' : ''
            let tabs_per_tail[tab.label] = get(tabs_per_tail, tab.label, 0) + 1
            let path_tabs += [tab]
        elseif -1 < index(['nofile','acwrite'], getbufvar(bufnum, '&buftype')) " scratch buffer
            let tab.label = ( show_mod ? '!' . screen_num : screen_num ? screen_num . ' !' : '!' )
        else " unnamed file
            let tab.label = ( show_mod && getbufvar(bufnum, '&mod') ? '+' : '' )
                        \             . ( screen_num ? screen_num : '*' )
        endif
        let tabs += [tab]
    endfor

    " disambiguate same-basename files by adding trailing path segments
    while len(filter(tabs_per_tail, 'v:val > 1'))
        let [ambiguous, tabs_per_tail] = [tabs_per_tail, {}]
        for tab in path_tabs
            if -1 < tab.sep && has_key(ambiguous, tab.label)
                let tab.sep = strridx(tab.path, s:dirsep, tab.sep - 1)
                let tab.label = tab.path[tab.sep + 1:]
            endif
            let tabs_per_tail[tab.label] = get(tabs_per_tail, tab.label, 0) + 1
        endfor
    endwhile

    " now keep the current buffer center-screen as much as possible:

    " 1. setup
    let lft = { 'lasttab':  0, 'cut':  '.', 'indicator': '<', 'width': 0, 'half': &columns / 2 }
    let rgt = { 'lasttab': -1, 'cut': '.$', 'indicator': '>', 'width': 0, 'half': &columns - lft.half }

    " 2. sum the string lengths for the left and right halves
    let currentside = lft
    for tab in tabs
        let tab.label = lpad . get(tab, 'pre', '') . tab.label . ' '
        let tab.width = strwidth(strtrans(tab.label))
        if centerbuf == tab.num
            let halfwidth = tab.width / 2
            let lft.width += halfwidth
            let rgt.width += tab.width - halfwidth
            let currentside = rgt
            continue
        endif
        let currentside.width += tab.width
    endfor
    if currentside is lft " centered buffer not seen?
        " then blame any overflow on the right side, to protect the left
        let [lft.width, rgt.width] = [0, lft.width]
    endif

    " 3. toss away tabs and pieces until all fits:
    if ( lft.width + rgt.width ) > &columns
        let oversized
                    \ = lft.width < lft.half ? [ [ rgt, &columns - lft.width ] ]
                    \ : rgt.width < rgt.half ? [ [ lft, &columns - rgt.width ] ]
                    \ :                        [ [ lft, lft.half ], [ rgt, rgt.half ] ]
        for [side, budget] in oversized
            let delta = side.width - budget
            " toss entire tabs to close the distance
            while delta >= tabs[side.lasttab].width
                let delta -= remove(tabs, side.lasttab).width
            endwhile
            " then snip at the last one to make it fit
            let endtab = tabs[side.lasttab]
            while delta > ( endtab.width - strwidth(strtrans(endtab.label)) )
                let endtab.label = substitute(endtab.label, side.cut, '', '')
            endwhile
            let endtab.label = substitute(endtab.label, side.cut, side.indicator, '')
        endfor
    endif

    if len(tabs) | let tabs[0].label = substitute(tabs[0].label, lpad, ' ', '') | endif

    let swallowclicks = '%'.(1 + tabpagenr('$')).'X'
    return swallowclicks . join(map(tabs,'printf("%%#BufTabLine%s#%s",v:val.hilite,strtrans(v:val.label))'),'') . '%#BufTabLineFill#'
endfunction

function! BUpdate(zombie)
    set tabline=
    if tabpagenr('$') > 1 | set guioptions+=e showtabline=2 | return | endif
    set guioptions-=e
    if 0 == g:buftabline_show
        set showtabline=1
        return
    elseif 1 == g:buftabline_show
        " account for BufDelete triggering before buffer is actually deleted
        let bufnums = filter(UserBuffers(), 'v:val != a:zombie')
        let &g:showtabline = 1 + ( len(bufnums) > 1 )
    elseif 2 == g:buftabline_show
        set showtabline=2
    endif
    set tabline=%!Render()
endfunction

augroup BufTabLine
    autocmd!
    autocmd VimEnter  * call BUpdate(0)
    autocmd TabEnter  * call BUpdate(0)
    autocmd BufAdd    * call BUpdate(0)
    autocmd BufDelete * call BUpdate(str2nr(expand('<abuf>')))
augroup END

for s:n in range(1, g:buftabline_plug_max) + ( g:buftabline_plug_max > 0 ? [-1] : [] )
    let s:b = s:n == -1 ? -1 : s:n - 1
    execute printf("noremap <silent> <Plug>BufTabLine.Go(%d) :<C-U>exe 'b'.get(UserBuffers(),%d,'')<cr>", s:n, s:b)
endfor
unlet! s:n s:b
" }}}
