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
vnoremap * :<C-u>call extended#VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call extended#VSetSearch()<CR>??<CR><c-o>
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
onoremap <silent>ai :<C-U>call extended#IndTxtObj(0)<CR>
onoremap <silent>ii :<C-U>call extended#IndTxtObj(1)<CR>
vnoremap <silent>ai :<C-U>call extended#IndTxtObj(0)<CR><Esc>gv
vnoremap <silent>ii :<C-U>call extended#IndTxtObj(1)<CR><Esc>gv
" Numbers
xnoremap <silent> aN :<c-u>call extended#aroundNumber()<cr>
onoremap <silent> aN :<c-u>call extended#aroundNumber()<cr>
xnoremap <silent> iN :<c-u>call extended#inNumber()<cr>
onoremap <silent> iN :<c-u>call extended#inNumber()<cr>
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
