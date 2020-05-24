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

