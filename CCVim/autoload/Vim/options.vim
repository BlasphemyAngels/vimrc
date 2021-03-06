function! Vim#options#list() abort
  let list = []
  if has('patch-7.4.2010') && 0
    for var in getcompletion('g:vim_','var')
      call add(list, var . ' = ' . string(get(g:, var[2:] , '')))
    endfor
  else
    redraw
    for var in filter(map(s:execute('let g:'), "matchstr(v:val, '\\S\\+')"), "v:val =~# '^vim_'")
      call add(list,'g:' . var . ' = ' . string(get(g:, var , '')))
    endfor
  endif
  return list
endfunction

function! s:execute(cmd) abort
  if exists('*execute')
    return split(execute(a:cmd), "\n")
  endif

  redir => output
  execute a:cmd
  redir END
  return split(output, "\n")
endfunction

" vim:set et sw=2:
