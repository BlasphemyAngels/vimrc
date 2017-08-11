scriptencoding utf-8
"vimfiler setting
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:block-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
noremap <silent> <F4> :call OpenVimfiler()<CR>
function! OpenVimfiler() abort
    if bufnr('vimfiler') == -1
        VimFiler
        AirlineRefresh
        wincmd p
        if &filetype !=# 'startify'
            IndentLinesToggle
            IndentLinesToggle
        endif
        wincmd p
    else
        VimFiler
        AirlineRefresh
    endif
endfunction
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_restore_alternate_file = 1
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = ''
let g:vimfiler_readonly_file_icon = '*'
let g:vimfiler_marked_file_icon = '√'
"let g:vimfiler_preview_action = 'auto_preview'
let g:vimfiler_ignore_pattern = [
            \ '^\.git$',
            \ '^\.DS_Store$',
            \ '^\.init\.vim-rplugin\~$',
            \ '^\.netrwhist$',
            \ '\.class$'
            \]

if has('mac')
    let g:vimfiler_quick_look_command =
                \ '/Applications//Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
else
    let g:vimfiler_quick_look_command = 'gloobus-preview'
endif

call vimfiler#custom#profile('default', 'context', {
            \ 'explorer' : 1,
            \ 'winwidth' : 30,
            \ 'winminwidth' : 30,
            \ 'toggle' : 1,
            \ 'columns' : 'type',
            \ 'auto_expand': 1,
            \ 'direction' : 'rightbelow',
            \ 'parent': 0,
            \ 'explorer_columns' : 'type',
            \ 'status' : 1,
            \ 'safe' : 0,
            \ 'split' : 1,
            \ 'hidden': 1,
            \ 'no_quit' : 1,
            \ 'force_hide' : 0,
            \ })
augroup vfinit
    au!
    autocmd FileType vimfiler call s:vimfilerinit()
    autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') |
                \ q | endif
augroup END
function! s:vimfilerinit()
    set nonumber
    set norelativenumber

    silent! nunmap <buffer> <Space>
    silent! nunmap <buffer> <C-l>
    silent! nunmap <buffer> <C-j>
    silent! nunmap <buffer> E
    silent! nunmap <buffer> gr
    silent! nunmap <buffer> gf
    silent! nunmap <buffer> -
    silent! nunmap <buffer> s

    nnoremap <silent><buffer> gr  :<c-u>denite grep:<c-r>=<sid>selected()<cr> -buffer-name=grep<cr>
    nnoremap <silent><buffer> gf  :<c-u>denite file_rec:<c-r>=<sid>selected()<cr><cr>
    nnoremap <silent><buffer> gd  :<c-u>call <sid>change_vim_current_dir()<cr>
    nnoremap <silent><buffer><expr> sg  vimfiler#do_action('vsplit')
    nnoremap <silent><buffer><expr> sv  vimfiler#do_action('split')
    nnoremap <silent><buffer><expr> st  vimfiler#do_action('tabswitch')
    nmap <buffer> gx     <plug>(vimfiler_execute_vimfiler_associated)
    nmap <buffer> '      <plug>(vimfiler_toggle_mark_current_line)
    nmap <buffer> v      <plug>(vimfiler_quick_look)
    nmap <buffer> p      <plug>(vimfiler_preview_file)
    nmap <buffer> v      <plug>(vimfiler_clear_mark_all_lines)
    nmap <buffer> i      <plug>(vimfiler_switch_to_history_directory)
    nmap <buffer> <tab>  <plug>(vimfiler_switch_to_other_window)
    nmap <buffer> <c-r>  <plug>(vimfiler_redraw_screen)
endf
