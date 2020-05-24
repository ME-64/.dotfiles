" PLUGINS {{{
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf',  {'dir': '~/.fzf', 'do': './install --bin'} | Plug 'junegunn/fzf.vim'
Plug 'sainnhe/gruvbox-material'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'wellle/targets.vim'
Plug 'kana/vim-operator-user'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'habamax/vim-sendtoterm'
Plug 'dstein64/vim-startuptime', {'on': ['StartupTime']}
Plug 'tpope/vim-repeat'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'mbbill/undotree', {'on': ['UndotreeToggle']}
call plug#end()
" }}}
" OPTIONS {{{
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat^=%f:%l:%c:%m
endif
" }}}
" AUTOCOMMANDS {{{
autocmd BufReadPost *
            \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
            \ |   exe "normal! g`\""
            \ | endif
autocmd VimResized * :wincmd =
au InsertLeave * silent! set nopaste
au TerminalOpen * if &buftype == 'terminal' | setlocal nolist | endif
au FileType vim set formatoptions-=cro
" }}}
" MAPPINGS {{{
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
nnoremap <C-w>q <C-w>c
nnoremap zZ zMzazt
tnoremap <F1> <C-W>N
nmap <silent> <leader>I ^vii<C-V>I
nmap <silent> <leader>A ^vii<C-V>$A
" get highlight group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" insert current line into cmd
if !has('patch-8.0.1787')
    cnoremap <C-r><C-l> <C-r>=getline('.')<CR>
endif
vnoremap * :<C-u>call VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call VSetSearch()<CR>??<CR><c-o>
" }}}
" TEXT OBJECTS {{{
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
onoremap <silent>ai :<C-U>call IndTxtObj(0)<CR>
onoremap <silent>ii :<C-U>call IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-U>call IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-U>call IndTxtObj(1)<CR><Esc>gv
" Numbers
xnoremap <silent> aN :<c-u>call AroundNumber()<cr>
onoremap <silent> aN :<c-u>call AroundNumber()<cr>
xnoremap <silent> iN :<c-u>call InNumber()<cr>
onoremap <silent> iN :<c-u>call InNumber()<cr>
" Comments
 let g:textobj_comment_no_default_key_mappings=1
xmap <silent> aC <Plug>(textobj-comment-a)
xmap <silent> iC <Plug>(textobj-comment-i)
omap <silent> aC <Plug>(textobj-comment-a)
omap <silent> iC <Plug>(textobj-comment-i)


" Send to terminal
let g:sendtoterm_expandtab=0
xmap gt  <Plug>(SendToTerm)
nmap gt  <Plug>(SendToTerm)
omap gt  <Plug>(SendToTerm)
nmap gtt <Plug>(SendToTermLine)

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

let regNums = [ '0b[01]', '0x\x', '\d' ]

function! InNumber()
    let l:magic = &magic
    set magic
    let l:lineNr = line('.')
    let l:pat = join(regNums, '\+\|') . '\+'
    if (!search(l:pat, 'ce', l:lineNr))
        return
    endif
    normal! v
    call search(l:pat, 'cb', l:lineNr)
    let &magic = l:magic
endfunction

let regNums = [ '0b[01]', '0x\x', '\d' ]

function! InNumber()
    let l:magic = &magic
    set magic
    let l:lineNr = line('.')
    let l:pat = join(regNums, '\+\|') . '\+'
    if (!search(l:pat, 'ce', l:lineNr))
        return
    endif
    normal! v
    call search(l:pat, 'cb', l:lineNr)
    let &magic = l:magic
endfunction

function! AroundNumber()
    let l:magic = &magic
    set magic
    let l:lineNr = line('.')
    let l:pat = join(regNums, '\+\|') . '\+'
    if (!search(l:pat, 'ce', l:lineNr))
        return
    endif
    call search('\%'.(virtcol('.')+1).'v\s*', 'ce', l:lineNr)
    normal! v
    call search(l:pat, 'cb', l:lineNr)
    call search('\s*\%'.virtcol('.').'v', 'b', l:lineNr)
    let &magic = l:magic
endfunction

function! IndTxtObj(inner)
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

function! VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
function! IndTxtObj(inner)
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

function! VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction


" }}}
" COMMANDS {{{
command BDO :%bd|e#|bd#
cnoreabbrev bon BDO
command BDA :%bd
cnoreabbrev bda BDA
command BDK :bp|bd#
cnoreabbrev bdk BDK
cnoreabbrev ipy ipython --no-autoindent --pprint --colors='NoColor' --nosep --no-banner
cnoreabbrev ipt terminal ++close ipython --no-autoindent --pprint --colors='NoColor' --nosep --no-banner
cnoreabbrev vsb vert sb
command SW :w !sudo tee > /dev/null %

cabbrev lex 20Lex
cnoreabbrev ex Explore
inoreabbrev <expr> #!! "#!/usr/bin/env" . (empty(&filetype) ? '' : ' '.&filetype)

" see difference between current buffer and the file opened initially
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif

" }}}
" COC NVIM {{{

let g:coc_global_extensions = ['coc-python', 'coc-json']
inoremap <expr> <C-j> pumvisible() ? '<C-n>' : '<Nop>'
inoremap <expr> <C-k> pumvisible() ? '<C-p>' : '<Nop>'
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> K :call <SID>show_documentation()<CR>
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
" FZF {{{

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
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <C-f>b :Buffers<CR>
nnoremap <silent> <C-f>l :BLines<CR>
nnoremap <silent> <C-f>L :Lines<CR>
nnoremap <silent> <C-f>h :Help<CR>
nnoremap <silent> <C-f>d :call fzf#run(fzf#wrap({'source': 'fdfind --type d . ~/', 'sink': 'cd'}))<CR>

" }}}
" UNDOTREE {{{

nnoremap <leader>u :UndotreeToggle<cr>
let g:undotree_WindowLayout=4
let g:undotree_SplitWidth=40
let g:undotree_SetFocusWhenToggle=1
let g:undotree_ShortIndicators=1

" }}}
" HTML/CSS/JS {{{
autocmd FileType html setlocal shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2
autocmd FileType javascript nnoremap <buffer> <leader>jc ^iconsole.log(<esc>A);<esc>
autocmd FileType javascript vnoremap <buffer> <leader>jc diconsole.log(<esc>p`]li);<esc>
setlocal iskeyword+=-
" }}}
" MARKDOWN {{{
let g:markdown_fenced_languages=['html', 'css', 'javascript', 'python', 'js=javascript', 'py=python']
let g:markdown_minlines = 100
let g:markdown_folding=1
autocmd FileType markdown setlocal nofoldenable
autocmd FileType markdown setlocal formatoptions+=t sw=2 sts=2 et tw=80
autocmd FileType markdown nnoremap <buffer> <leader>mh1 :s/^#* //ge<CR>^i#<space><esc>0
autocmd FileType markdown nnoremap <buffer> <leader>mh2 :s/^#* //ge<CR>^i##<space><esc>0
autocmd FileType markdown nnoremap <buffer> <leader>mh3 :s/^#* //ge<CR>^i###<space><esc>0
autocmd FileType markdown nnoremap <buffer> <leader>mh4 :s/^#* //ge<CR>^i####<space><esc>0
autocmd FileType markdown nnoremap <buffer> <leader>mh5 :s/^#* //ge<CR>^i#####<space><esc>0
autocmd FileType markdown nnoremap <buffer> <leader>mh6 :s/^#* //ge<CR>^i######<space><esc>0
autocmd FileType markdown nnoremap <buffer> <leader>mhc :s/^#* //ge<CR>0
autocmd FileType markdown nnoremap <buffer> <leader>mc 0i```<CR><CR>```<esc>kka
" Code block (triple back-tick) object with <Shift-`>
autocmd FileType markdown xnoremap <silent> i¬ g_?^\s*```<cr>jo/^\s*```<cr>kV:<c-u>nohl<cr>gv
autocmd FileType markdown xnoremap <silent> a¬ g_?^\s*```<cr>o/^\s*```<cr>V:<c-u>nohl<cr>gv
autocmd FileType markdown onoremap <silent> i¬ :<C-U>execute "normal vi~"<cr>
autocmd FileType markdown onoremap <silent> a¬ :<C-U>execute "normal va~"<cr>
" }}}
" NETRW {{{
setlocal bufhidden=wipe
let g:netrw_fastbrowse=0
let g:netrw_altfile=0
" }}}
" PYTHON {{{

let g:python_highlight_all=1
autocmd FileType python setlocal foldlevelstart=99
autocmd FileType python setlocal foldmethod=marker
let g:is_pythonsense_suppress_object_keymaps = 1
let g:is_pythonsense_suppress_motion_keymaps = 1
let g:is_pythonsense_suppress_location_keymaps = 1
autocmd FileType python inoreabbr <buffer> ipdb import<space>pdb;<space>pdb.set_trace();<BS>
autocmd FileType python nnoremap <buffer> <leader>rf :w !python3 %<CR>
autocmd FileType python nnoremap <buffer> <leader>rt :w !pytest --doctest-modules %<CR>
autocmd FileType python nnoremap <buffer> <leader>rl :w !pylint -f parseable -r n -s n -E %<CR>
autocmd FileType python nnoremap <buffer> <leader>rs :w !mypy %<CR>
autocmd FileType python nnoremap <buffer> zb zfl5l4i<CR><Esc>i#<Space><Esc>4k05l73a=<esc>4j05l73a-<esc>2k0i
autocmd FileType python nnoremap <buffer> zB zfl5l4i<CR><Esc>i#<Space><Esc>4k05l73a=<esc>4j05l73a-<esc>4k06lR
autocmd FileType python omap ac <Plug>(PythonsenseOuterClassTextObject)
autocmd FileType python omap ic <Plug>(PythonsenseInnerClassTextObject)
autocmd FileType python omap af <Plug>(PythonsenseOuterFunctionTextObject)
autocmd FileType python omap if <Plug>(PythonsenseInnerFunctionTextObject)
autocmd FileType python vmap ac <Plug>(PythonsenseOuterClassTextObject)
autocmd FileType python vmap ic <Plug>(PythonsenseInnerClassTextObject)
autocmd FileType python vmap af <Plug>(PythonsenseOuterFunctionTextObject)
autocmd FileType python vmap if <Plug>(PythonsenseInnerFunctionTextObject)
autocmd FileType python vmap aD <Plug>(PythonsenseOuterDocStringTextObject)
autocmd FileType python vmap iD <Plug>(PythonsenseInnerDocStringTextObject)
autocmd FileType python omap aD <Plug>(PythonsenseOuterDocStringTextObject)
autocmd FileType python omap iD <Plug>(PythonsenseInnerDocStringTextObject)



" }}}
