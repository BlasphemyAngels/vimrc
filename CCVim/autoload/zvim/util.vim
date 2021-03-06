scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim
let g:unite_source_menu_menus =
            \ get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.CustomKeyMaps = {'description':
            \ 'Custom mapped keyboard shortcuts                   [unite]<SPACE>'}
let g:unite_source_menu_menus.CustomKeyMaps.command_candidates =
            \ get(g:unite_source_menu_menus.CustomKeyMaps,'command_candidates', [])
fu! zvim#util#defineMap(type,key,value,desc,...) abort
    exec a:type . ' ' . a:key . ' ' . a:value
    let description = '➤ '
                \. a:desc
                \. repeat(' ', 80 - len(a:desc) - len(a:key))
                \. a:key
    let cmd = len(a:000) > 0 ? a:000[0] : a:value
    call add(g:unite_source_menu_menus.CustomKeyMaps.command_candidates, [description,cmd])

endf
fu! zvim#util#source_rc(file) abort
    if filereadable(g:Config_Main_Home. '/' . a:file)
        execute 'source ' . g:Config_Main_Home  . '/' . a:file
    endif
endf

fu! zvim#util#CopyToClipboard(...) abort
    try
        let @+=expand('%:p')
        echo 'Copied to clipboard ' . @+
    catch /^Vim\%((\a\+)\)\=:E354/
        if has('nvim')
            echohl WarningMsg | echom 'Can not find clipboard, for more info see :h clipboard' | echohl None
        else
            echohl WarningMsg | echom 'You need compile you vim with +clipboard feature' | echohl None
        endif
    endtry
endf

fu! zvim#util#check_if_expand_tab() abort
    let has_noexpandtab = search('^\t','wn')
    let has_expandtab = search('^    ','wn')
    if has_noexpandtab && has_expandtab
        let idx = inputlist ( ['ERROR: current file exists both expand and noexpand TAB, python can only use one of these two mode in one file.\nSelect Tab Expand Type:',
                    \ '1. expand (tab=space, recommended)',
                    \ '2. noexpand (tab=\t, currently have risk)',
                    \ '3. do nothing (I will handle it by myself)'])
        let tab_space = printf('%*s',&tabstop,'')
        if idx == 1
            let has_noexpandtab = 0
            let has_expandtab = 1
            silent exec '%s/\t/' . tab_space . '/g'
        elseif idx == 2
            let has_noexpandtab = 1
            let has_expandtab = 0
            silent exec '%s/' . tab_space . '/\t/g'
        else
            return
        endif
    endif
    if has_noexpandtab == 1 && has_expandtab == 0
        echomsg 'substitute space to TAB...'
        set noexpandtab
        echomsg 'done!'
    elseif has_noexpandtab == 0 && has_expandtab == 1
        echomsg 'substitute TAB to space...'
        set expandtab
        echomsg 'done!'
    else
        " it may be a new file
        " we use original vim setting
    endif
endf

function! zvim#util#BufferEmpty() abort
    let l:current = bufnr('%')
    if ! getbufvar(l:current, '&modified')
        enew
        silent! execute 'bdelete '.l:current
    endif
endfunction


function! zvim#util#listDirs(dir) abort
    let dir = fnamemodify(a:dir, ':p')
    if isdirectory(dir)
        let cmd = printf('ls -F %s | grep /$', dir)
        return map(systemlist(cmd), 'v:val[:-2]')
    endif
    return []
endfunction

function! zvim#util#OpenVimfiler() abort
    if bufnr('vimfiler') == -1
        silent VimFiler
        if exists(':AirlineRefresh')
            AirlineRefresh
        endif
        wincmd p
        if &filetype !=# 'startify'
            IndentLinesToggle
            IndentLinesToggle
        endif
        wincmd p
    else
        silent VimFiler
        doautocmd WinEnter
        if exists(':AirlineRefresh')
            AirlineRefresh
        endif
    endif
endfunction

fu! zvim#util#Generate_ignore(ignore,tool, ...) abort
    let ignore = []
    if a:tool ==# 'ag'
        for ig in split(a:ignore,',')
            call add(ignore, '--ignore')
            call add(ignore, ig )
        endfor
    elseif a:tool ==# 'rg'
        for ig in split(a:ignore,',')
            call add(ignore, '-g')
            if a:0 > 0
                call add(ignore, "'!" . ig . "'")
            else
                call add(ignore, '!' . ig)
            endif
        endfor
    endif
    return ignore
endf

let &cpo = s:save_cpo
unlet s:save_cpo
