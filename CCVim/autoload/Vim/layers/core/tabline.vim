" @section core#tabline, layer-core-tabline
" @parentsection layers
" This layer provides default tabline for Vim

scriptencoding utf-8
let s:messletters = Vim#api#import('messletters')
let s:file = Vim#api#import('file')
let s:BUFFER = Vim#api#import('vim#buffer')
let s:HI = Vim#api#import('vim#highlight')

let g:_vim_tabline_loaded = 1
let s:buffers = s:BUFFER.listed_buffers()

" init
let s:separators = {
            \ 'arrow' : ["\ue0b0", "\ue0b2"],
            \ 'curve' : ["\ue0b4", "\ue0b6"],
            \ 'slant' : ["\ue0b8", "\ue0ba"],
            \ 'brace' : ["\ue0d2", "\ue0d4"],
            \ 'fire' : ["\ue0c0", "\ue0c2"],
            \ 'nil' : ['', ''],
            \ }

let s:i_separators = {
            \ 'arrow' : ["\ue0b1", "\ue0b3"],
            \ 'bar' : ["|", "|"],
            \ 'nil' : ['', ''],
            \ }

function! s:tabname(id) abort
    if g:vim_buffer_index_type == 3
        let id = s:messletters.index_num(a:id)
    elseif g:vim_buffer_index_type == 4
        let id = a:id
    else
        let id = s:messletters.bubble_num(a:id, g:vim_buffer_index_type) . ' '
    endif
    let fn = fnamemodify(bufname(a:id), ':t')
    if g:vim_enable_tabline_filetype_icon
        let icon = s:file.fticon(fn)
        if !empty(icon)
            let fn = icon . ' ' . fn
        endif
    endif
    if empty(fn)
        return 'No Name'
    else
        return id . fn
    endif
endfunction

function! Vim#layers#core#tabline#get() abort
    let nr = tabpagenr('$')
    let t = ''
    if nr > 1
        let ct = tabpagenr()
        if ct == 1
            let t = '%#Vim_tabline_a#  '
        else
            let t = '%#Vim_tabline_b#  '
        endif
        for i in range(1, nr)
            if i == ct
                let t .= '%#Vim_tabline_a#'
            endif
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let name = fnamemodify(bufname(buflist[winnr - 1]), ':t')
            if empty(name)
                let name = 'No Name'
            endif
            if g:vim_buffer_index_type == 3
                let id = s:messletters.index_num(i)
            elseif g:vim_buffer_index_type == 4
                let id = i
            else
                let id = s:messletters.circled_num(i, g:vim_buffer_index_type)
            endif
            if g:vim_enable_tabline_filetype_icon
                let icon = s:file.fticon(name)
                if !empty(icon)
                    let name = icon . ' ' . name
                endif
            endif
            let t .= id . ' ' . name
            if i == ct - 1
                let t .= ' %#Vim_tabline_b_Vim_tabline_a#' . s:lsep . ' '
            elseif i == ct
                let t .= ' %#Vim_tabline_a_Vim_tabline_b#' . s:lsep . ' '
            else
                let t .= ' ' . s:ilsep . ' '
            endif
        endfor
        let t .= '%=%#Vim_tabline_a_Vim_tabline_b#' . s:rsep
        let t .= '%#Vim_tabline_a# Tabs'
    else
        let s:buffers = s:BUFFER.listed_buffers()
        let g:_vim_list_buffers = s:buffers
        if len(s:buffers) == 0
            return ''
        endif
        let ct = bufnr('%')
        let pt = index(s:buffers, ct) > 0 ? s:buffers[index(s:buffers, ct) - 1] : -1
        if ct == get(s:buffers, 0, -1)
            let t = '%#Vim_tabline_a# '
        else
            let t = '%#Vim_tabline_b# '
        endif
        for i in s:buffers
            if i == ct
                let t .= '%#Vim_tabline_a#'
            endif
            let name = fnamemodify(bufname(i), ':t')
            if empty(name)
                let name = 'No Name'
            endif
            if g:vim_buffer_index_type == 3
                let id = s:messletters.index_num(index(s:buffers, i) + 1)
            elseif g:vim_buffer_index_type == 4
                let id = index(s:buffers, i) + 1
            else
                let id = s:messletters.circled_num(index(s:buffers, i) + 1, g:vim_buffer_index_type)
            endif
            if g:vim_enable_tabline_filetype_icon
                let icon = s:file.fticon(name)
                if !empty(icon)
                    let name = icon . ' ' . name
                endif
            endif
            let t .= id . ' ' . name
            if i == ct
                let t .= ' %#Vim_tabline_a_Vim_tabline_b#' . s:lsep . ' '
            elseif i == pt
                let t .= ' %#Vim_tabline_b_Vim_tabline_a#' . s:lsep . ' '
            else
                let t .= ' ' . s:ilsep . ' '
            endif
        endfor
        let t .= '%=%#Vim_tabline_a_Vim_tabline_b#' . s:rsep
        let t .= '%#Vim_tabline_a# Buffers'
    endif
    return t
endfunction
function! Vim#layers#core#tabline#config() abort
    let [s:lsep , s:rsep] = get(s:separators, g:vim_statusline_separator, s:separators['arrow'])
    let [s:ilsep , s:irsep] = get(s:i_separators, g:vim_statusline_inactive_separator, s:separators['arrow'])
    set tabline=%!Vim#layers#core#tabline#get()
    augroup Vim_tabline
        autocmd!
        autocmd ColorScheme * call Vim#layers#core#tabline#def_colors()
    augroup END
    for i in range(1, 9)
        exe "call Vim#mapping#def('nmap <silent>', '<leader>" . i
                    \ . "', ':call Vim#layers#core#tabline#jump("
                    \ . i . ")<cr>', 'Switch to airline tab " . i
                    \ . "', '', 'tabline index " . i . "')"
    endfor
    call Vim#mapping#def('nmap', '<leader>-', ':bprevious<cr>', 'Switch to previous airline tag', '', 'window previous')
    call Vim#mapping#def('nmap', '<leader>+', ':bnext<cr>', 'Switch to next airline tag', '', 'window next')
    "call Vim#mapping#space#def('nmap', ['-'], 'bprevious', 'window previous', 1)
    "call Vim#mapping#space#def('nmap', ['+'], 'bnext', 'window next', 1)
endfunction

function! Vim#layers#core#tabline#jump(id) abort
    if len(s:buffers) >= a:id
        let bid = s:buffers[a:id - 1]
        exe 'b' . bid
    endif
endfunction

function! Vim#layers#core#tabline#def_colors() abort
    let name = get(g:, 'colors_name', 'gruvbox')
    try
        let t = Vim#mapping#guide#theme#{name}#palette()
    catch /^Vim\%((\a\+)\)\=:E117/
        let t = Vim#mapping#guide#theme#gruvbox#palette()
    endtry
    exe 'hi! Vim_tabline_a ctermbg=' . t[0][2] . ' ctermfg=' . t[0][3] . ' guibg=' . t[0][1] . ' guifg=' . t[0][0]
    exe 'hi! Vim_tabline_b ctermbg=' . t[1][2] . ' ctermfg=' . t[1][3] . ' guibg=' . t[1][1] . ' guifg=' . t[1][0]
    call s:HI.hi_separator('Vim_tabline_a', 'Vim_tabline_b')
endfunction
