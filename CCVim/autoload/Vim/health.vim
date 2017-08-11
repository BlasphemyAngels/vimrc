function! Vim#health#report() abort
  let items = map(Vim#util#globpath(&rtp,'autoload/Vim/health/*'), "fnamemodify(v:val,':t:r')")
  let report = []
  for item in items
    try
      let result = Vim#health#{item}#check()
      call extend(report,result)
    catch /^Vim\%((\a\+)\)\=:E117/
      call extend(report,[
            \ '',
            \ 'Vim Health Error:',
            \ '    There is no function: Vim#health#' . item . '#check()',
            \ '',
            \ ])
    endtry
  endfor
  return join(report, "\n")
endfunction

" vim:set et sw=2:
