function! Vim#layers#core#plugins() abort
    return [
                \ ['Shougo/vimproc.vim', {'build' : ['make']}],
                \ ['benizi/vim-automkdir'],
                \ ['airblade/vim-rooter', {'on_cmd' : 'Rooter'}],
                \ ]
endfunction

function! Vim#layers#core#config() abort
    let g:rooter_silent_chdir = 1
    call Vim#layers#load('core#banner')
    call Vim#layers#load('core#statusline')
    call Vim#layers#load('core#tabline')
    call Vim#mapping#space#def('nnoremap', ['p', 't'], 'Rooter', 'find-project-root', 1)
    call Vim#mapping#space#def('nnoremap', ['p', 'f'], 'CtrlP', 'find files in current project', 1)
    call Vim#mapping#space#def('nnoremap', ['p', '/'], 'Grepper', 'fuzzy search for text in current project', 1)
endfunction
