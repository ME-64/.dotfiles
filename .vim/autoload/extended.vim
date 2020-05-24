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

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
