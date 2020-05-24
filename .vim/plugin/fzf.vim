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
