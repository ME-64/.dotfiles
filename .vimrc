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
set textwidth=79 nowrap
set spellfile=~/.vim/spell/en.utf-8.add spelllang=en_gb
set foldmethod=indent
set laststatus=2 showtabline=0 noruler noshowmatch showcmd noshowmode
set fillchars=stl:\ ,stlnc:\ ,vert:\|
set ve=all
set termguicolors
runtime macros/matchit.vim
set synmaxcol=200
set path=.,,
set nomore
" set tags=./tags;,tags; " need to look for standard library tags
" }}}

" PLUGINS {{{
call plug#begin('~/.vim/plugged')
" File Navigation
Plug 'junegunn/fzf',  {'dir': '~/.fzf', 'do': './install --bin'} | Plug 'junegunn/fzf.vim'
    Plug 'sainnhe/gruvbox-material'
" Custom Nouns
    Plug 'kana/vim-textobj-user'
    " Plug 'glts/vim-textobj-comment'
" Custom Verbs
    Plug 'kana/vim-operator-user'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'
    Plug 'junegunn/vim-easy-align'
" Helpers
    Plug 'dstein64/vim-startuptime', {'on': ['StartupTime']}
" Python stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Poppy things
    Plug 'mbbill/undotree', {'on': ['UndotreeToggle']}
call plug#end()
filetype plugin indent on
" }}}

" BINDINGS {{{
" Leader remap
nnoremap <SPACE> <Nop>
let mapleader = " "
" Inserting new lines without leaving normal mode
" Save files when you forgot to sudo into it
cmap W!! w !sudo tee > /dev/null %
nmap Q <Nop>

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
" close all other folds, open only current
nnoremap zZ zMzazz

nnoremap <leader>l :w !ls<CR>:

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

" Operators {{{
function! RemoveTrailingWhitespace()
    for lineno in range(a:firstline, a:lastline)
        let line = getline(lineno)
        let cleanLine = substitute(line, '\(\s\| \)\+$', '', 'e')
        call setline(lineno, cleanLine)
    endfor
endfunction

command! -range RT  :<line1>,<line2>call RemoveTrailingWhitespace()
command! -range=% RDB :<line1>,<line2>g/^$/,/./-j
command! -range=% RB :<line1>,<line2>g/^\s*$/d

" open in firefox, netrw
function! WebSearch(type, ...)
    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@
    if a:0
        silent exe "normal! `<" . a:type . "`>y"
    elseif a:type == 'line'
        silent exe "normal! '[V']y"
    elseif a:type == 'block'
        silent exe "normal! `[\<C-V>`]y"
    else
        silent exe "normal! `[v`]y"
    endif
    let search = substitute(trim(@@), ' \+', '+', 'g')
    silent! exe "!firefox --new-tab 'https://google.com/search?q=" . search . "'" . "&"
    redraw!
    let &selection = sel_save
    let @@ = reg_save
endfunction

nmap <silent> go :set opfunc=WebSearch<CR>g@
vmap <silent> go :<C-u>call WebSearch(visualmode(), 1)<Cr>

map <silent> grdb <Plug>(operator-RDB)
call operator#user#define_ex_command('RDB', 'RDB')
map <silent> grb <Plug>(operator-RB)
call operator#user#define_ex_command('RB', 'RB')
map <silent> grt <Plug>(operator-RT)
call operator#user#define_ex_command('RT', 'RT')
" }}}

" Python Stuff {{{
" running various tools
au FileType python nnoremap <buffer> <leader>rf :w !python3 %<CR>
au FileType python nnoremap <buffer> <leader>rt :w !pytest --doctest-modules %<CR>
au FileType python nnoremap <buffer> <leader>rl :w !pylint -f parseable -r n -s n -E %<CR>
au FileType python nnoremap <buffer> <leader>rs :w !mypy %<CR>
au FileType python inoreabbr ipdb import<space>pdb;<space>pdb.set_trace();<BS>
au FileType python setlocal nofoldenable
au FileType python setlocal foldmethod=indent

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

" HTML/CSS/JS {{{
" treat all htmldjangofiles as html (for ftplugins)
au FileType htmldjango set filetype=html
au FileType html setlocal shiftwidth=2 softtabstop=2
au FileType javascript setlocal shiftwidth=2 softtabstop=2
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
    vmap <buffer> <leader>fT :EasyAlign*<Bar><CR>
    nnoremap <buffer> <leader>mh1 :s/^#* //ge<CR>^i#<space><esc>0
    nnoremap <buffer> <leader>mh2 :s/^#* //ge<CR>^i##<space><esc>0
    nnoremap <buffer> <leader>mh3 :s/^#* //ge<CR>^i###<space><esc>0
    nnoremap <buffer> <leader>mh4 :s/^#* //ge<CR>^i####<space><esc>0
    nnoremap <buffer> <leader>mh5 :s/^#* //ge<CR>^i#####<space><esc>0
    nnoremap <buffer> <leader>mh6 :s/^#* //ge<CR>^i######<space><esc>0
    nnoremap <buffer> <leader>mhc :s/^#* //ge<CR>0
    nnoremap <buffer> <leader>mc 0i```<CR><CR>```<esc>kka
    setlocal nofoldenable
endfunction

augroup MarkdownSetup
    au!
    au FileType markdown call s:MarkdownStuff()
    au FileType markdown setlocal formatoptions+=t sw=2 sts=2 et tw=80
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
vnoremap <silent> az :<C-U>silent! normal! [zV]z<CR>
onoremap <silent> az :normal Vaz<CR>
vnoremap <silent> iz :<C-U>silent! normal! [zjVo]zk<CR>
onoremap <silent> iz :normal Viz<CR>

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

" many seps - https://gist.github.com/romainl/c0a8b57a36aec71a986f1120e1931f20
for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '-', '#' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor


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

" class & method python text objs
" TODO: don't change most recent search; work on two line functions,
" work when on top of a definition
function! s:PyObjs(typ, region, mode)
    let foldenabled = &foldenable
    let foldedmethod = &foldmethod
    exe "silent set foldenable"
    exe "silent set foldmethod=indent"
    if a:mode == 'v'
        normal ^]
    endif
    normal zR
    if a:typ == 'function'
        exe "normal ?def\<CR>"
    else
        exe "normal ?class\<CR>"
    endif

    if a:region == 'a'
        normal kjjV]zokoip
    else
        normal kjjV]z
    endif
    if foldenabled == 0
        set nofoldenable
    endif
    exe "silent set foldmethod=" . foldedmethod
endfunction

autocmd FileType python vmap af :<c-u>call <sid>PyObjs('function', 'a', 'v')<CR>
autocmd FileType python vmap if :<c-u>call <sid>PyObjs('function', 'i', 'v')<CR>
autocmd FileType python omap if :<c-u>call <sid>PyObjs('function', 'i', 'o')<CR>
autocmd FileType python omap af :<c-u>call <sid>PyObjs('function', 'a', 'o')<CR>
autocmd FileType python vmap aC :<c-u>call <sid>PyObjs('class', 'a', 'v')<CR>
autocmd FileType python vmap iC :<c-u>call <sid>PyObjs('class', 'i', 'v')<CR>
autocmd FileType python omap iC :<c-u>call <sid>PyObjs('class', 'i', 'o')<CR>
autocmd FileType python omap aC :<c-u>call <sid>PyObjs('class', 'a', 'o')<CR>

" }}}

" Abbreviations & Commands {{{
" nuking buffers
command BDO :%bd|e#|bd#
cnoreabbrev bon BDO
command BDA :%bd
cnoreabbrev bda BDA
command BDK :bp|bd#
cnoreabbrev bdk BDK

" terminal
cnoreabbrev ipy ipython --no-autoindent --pprint --colors='NoColor' --nosep --no-banner
" cnoreabbrev +c ++close
cnoreabbrev ipt terminal ++close ipython --no-autoindent --pprint --colors='NoColor' --nosep --no-banner
cnoreabbrev vsb vert sb

" Easy shebang
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

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
" see difference between current buffer and the file opened initially
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
" }}}

" Poppy Stuff {{{
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
let g:gruvbox_material_background='soft'
let g:gruvbox_material_enable_bold=1
colorscheme gruvbox-material
syntax enable
set background=dark
highlight! pythonFunction guifg=#d8a657
" Return to same line from when file last opened
autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif
  augroup END

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat^=%f:%l:%c:%m
endif

autocmd VimResized * :wincmd =

" only highlight while search is in progress
augroup vimrc-incsearch-highlight
    au!
    au CmdlineEnter [/\?] :set hlsearch
    au CmdlineLeave [/\?] :set nohlsearch
augroup END

au FileType vim set foldmethod=marker

" auto open quickfix when errors
augroup autoquickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
augroup END

" diable paste when exit insert mode
au InsertLeave * silent! set nopaste

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

" sendtoterm {{{
" https://github.com/habamax/vim-sendtoterm/blob/master/plugin/sendtoterm.vim
fun! s:get_terminal_windows()
    return map(filter(copy(getwininfo()), {k,v -> getbufvar(v.bufnr, '&buftype') == 'terminal'}), 'v:val')
endfu

fun! SendToTerm(...)
    let terms = s:get_terminal_windows()
    if len(terms) < 1
        echomsg "There is no visible terminal!"
        return
    endif

    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    endif

    let term_window = terms[0].winnr
    if len(terms) > 1
        let msg =  "Too many terminals open!"
        for t in terms
            let msg .= "\n\t[".t.winnr.']: '.t.variables.netrw_prvfile
        endfor
        let msg .= "\nSelect terminal: "
        let term_window = input(msg, terms[0].winnr)
    endif

    let sel_save = &selection
    let &selection = "inclusive"
    let reg_save = @@
    let clipboard_save = &clipboard
    let &clipboard = ""

    if a:1 == 'char'	" Invoked from Visual mode, use gv command.
        silent exe 'normal! gvy'
    elseif a:1 == 'line'
        silent exe "normal! '[V']y"
    else
        silent exe 'normal! `[v`]y'
    endif

    if has('nvim')
        exe term_window . "wincmd w"

        if has('win32')
            let @" .= "\r"
        else
            let @" .= "\n"
        endif
        normal! pG

        exe winnr('#') . "wincmd w"
    else
        let text = substitute(@", '\n\|$', '\r', "g")
        if !&expandtab && g:sendtoterm_expandtab
            let text = substitute(text, '\t', repeat(' ', shiftwidth()), "g")
        endif
        call term_sendkeys(winbufnr(term_window+0), text)
    endif

    let &selection = sel_save
    let @@ = reg_save
    let &clipboard = clipboard_save
endfun

xnoremap <expr> <Plug>(SendToTerm)     SendToTerm()
nnoremap <expr> <Plug>(SendToTerm)     SendToTerm()
nnoremap <expr> <Plug>(SendToTermLine) SendToTerm() . '_'

if !exists("g:sendtoterm_expandtab")
    let g:sendtoterm_expandtab = 1
endif
" }}}

" Commentary {{{
" https://github.com/tpope/vim-commentary/blob/master/plugin/commentary.vim
function! s:surroundings() abort
    return split(get(b:, 'commentary_format', substitute(substitute(substitute(
                \ &commentstring, '^$', '%s', ''), '\S\zs%s',' %s', '') ,'%s\ze\S', '%s ', '')), '%s', 1)
endfunction

function! s:strip_white_space(l,r,line) abort
    let [l, r] = [a:l, a:r]
    if l[-1:] ==# ' ' && stridx(a:line,l) == -1 && stridx(a:line,l[0:-2]) == 0
        let l = l[:-2]
    endif
    if r[0] ==# ' ' && a:line[-strlen(r):] != r && a:line[1-strlen(r):] == r[1:]
        let r = r[1:]
    endif
    return [l, r]
endfunction

function! s:go(...) abort
    if !a:0
        let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
        return 'g@'
    elseif a:0 > 1
        let [lnum1, lnum2] = [a:1, a:2]
    else
        let [lnum1, lnum2] = [line("'["), line("']")]
    endif

    let [l, r] = s:surroundings()
    let uncomment = 2
    for lnum in range(lnum1,lnum2)
        let line = matchstr(getline(lnum),'\S.*\s\@<!')
        let [l, r] = s:strip_white_space(l,r,line)
        if len(line) && (stridx(line,l) || line[strlen(line)-strlen(r) : -1] != r)
            let uncomment = 0
        endif
    endfor

    if get(b:, 'commentary_startofline')
        let indent = '^'
    else
        let indent = '^\s*'
    endif

    for lnum in range(lnum1,lnum2)
        let line = getline(lnum)
        if strlen(r) > 2 && l.r !~# '\\'
            let line = substitute(line,
                        \'\M' . substitute(l, '\ze\S\s*$', '\\zs\\d\\*\\ze', '') . '\|' . substitute(r, '\S\zs', '\\zs\\d\\*\\ze', ''),
                        \'\=substitute(submatch(0)+1-uncomment,"^0$\\|^-\\d*$","","")','g')
        endif
        if uncomment
            let line = substitute(line,'\S.*\s\@<!','\=submatch(0)[strlen(l):-strlen(r)-1]','')
        else
            let line = substitute(line,'^\%('.matchstr(getline(lnum1),indent).'\|\s*\)\zs.*\S\@<=','\=l.submatch(0).r','')
        endif
        call setline(lnum,line)
    endfor
    let modelines = &modelines
    try
        set modelines=0
        silent doautocmd User CommentaryPost
    finally
        let &modelines = modelines
    endtry
    return ''
endfunction

function! s:textobject(inner) abort
    let [l, r] = s:surroundings()
    let lnums = [line('.')+1, line('.')-2]
    for [index, dir, bound, line] in [[0, -1, 1, ''], [1, 1, line('$'), '']]
        while lnums[index] != bound && line ==# '' || !(stridx(line,l) || line[strlen(line)-strlen(r) : -1] != r)
            let lnums[index] += dir
            let line = matchstr(getline(lnums[index]+dir),'\S.*\s\@<!')
            let [l, r] = s:strip_white_space(l,r,line)
        endwhile
    endfor
    while (a:inner || lnums[1] != line('$')) && empty(getline(lnums[0]))
        let lnums[0] += 1
    endwhile
    while a:inner && empty(getline(lnums[1]))
        let lnums[1] -= 1
    endwhile
    if lnums[0] <= lnums[1]
        execute 'normal! 'lnums[0].'GV'.lnums[1].'G'
    endif
endfunction

command! -range -bar Commentary call s:go(<line1>,<line2>)
xnoremap <expr>   <Plug>Commentary     <SID>go()
nnoremap <expr>   <Plug>Commentary     <SID>go()
nnoremap <expr>   <Plug>CommentaryLine <SID>go() . '_'
onoremap <silent> <Plug>Commentary        :<C-U>call <SID>textobject(get(v:, 'operator', '') ==# 'c')<CR>
nnoremap <silent> <Plug>ChangeCommentary c:<C-U>call <SID>textobject(1)<CR>

if !hasmapto('<Plug>Commentary') || maparg('gc','n') ==# ''
    xmap gc  <Plug>Commentary
    nmap gc  <Plug>Commentary
    omap gc  <Plug>Commentary
    nmap gcc <Plug>CommentaryLine
    if maparg('c','n') ==# '' && !exists('v:operator')
        nmap cgc <Plug>ChangeCommentary
    endif
    nmap gcu <Plug>Commentary<Plug>Commentary
endif
" }}}

