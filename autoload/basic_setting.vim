" Dark powered mode of Vim, generated by Vim automatically.
let g:vim_enable_debug = 1
let g:vim_realtime_leader_guide = 1
call Vim#layers#load('incsearch')
call Vim#layers#load('lang#c')
call Vim#layers#load('lang#elixir')
call Vim#layers#load('lang#go')
call Vim#layers#load('lang#haskell')
call Vim#layers#load('lang#java')
call Vim#layers#load('lang#javascript')
call Vim#layers#load('lang#lua')
call Vim#layers#load('lang#perl')
call Vim#layers#load('lang#php')
call Vim#layers#load('lang#python')
call Vim#layers#load('lang#rust')
call Vim#layers#load('lang#swig')
call Vim#layers#load('lang#tmux')
call Vim#layers#load('lang#vim')
call Vim#layers#load('lang#xml')
call Vim#layers#load('shell')   
call Vim#layers#load('tools#screensaver')
let g:vim_enable_vimfiler_welcome = 1
let g:vim_enable_debug = 1
let g:deoplete#auto_complete_delay = 150
let g:vim_enable_tabline_filetype_icon = 1
let g:vim_enable_os_fileformat_icon = 1
let g:vim_buffer_index_type = 1
let g:neomake_vim_enabled_makers = []
if executable('vimlint')
    call add(g:neomake_vim_enabled_makers, 'vimlint') 
endif
if executable('vint')
    call add(g:neomake_vim_enabled_makers, 'vint') 
endif
if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec<CR>
endif
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''

