function! Vim#custom#profile(dict) abort
    for key in keys(a:dict)
        call s:set(key, a:dict[key])
    endfor
endfunction


function! s:set(key,val) abort
    if !exists('g:vim_' . a:key)
        call Vim#logger#warn('no option named ' . a:key)
    else
        exe 'let ' . 'g:vim_' . a:key . '=' . a:val
    endif
endfunction

