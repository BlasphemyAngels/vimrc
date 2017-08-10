""
" @section lang#python, layer-lang-python
" @parentsection layers
" To make this layer work well, you should install jedi.
" @subsection mappings
" >
"   mode            key             function
" <

function! Vim#layers#lang#python#plugins() abort
    let plugins = []
    " python
    if has('nvim')
        call add(plugins, ['zchee/deoplete-jedi',                    { 'on_ft' : 'python'}])
    else
        call add(plugins, ['davidhalter/jedi-vim',                   { 'on_ft' : 'python', 'if' : has('python') || has('python3')}])
    endif
    call add(plugins, ['Vimjas/vim-python-pep8-indent',                   { 'on_ft' : 'python'}])
    return plugins
endfunction

function! Vim#layers#lang#python#config()

call Vim#layers#edit#add_ft_head_tamplate('python',
            \ ['#!/usr/bin/env python',
            \ '# -*- coding: utf-8 -*-',
            \ '']
            \ )

endfunction
