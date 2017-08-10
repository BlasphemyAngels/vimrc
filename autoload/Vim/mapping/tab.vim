if g:vim_snippet_engine ==# 'neosnippet'
  function! Vim#mapping#tab#i_tab() abort
    if getline('.')[col('.')-2] ==# '{'&& pumvisible()
      return "\<C-n>"
    endif
    if neosnippet#expandable() && getline('.')[col('.')-2] ==# '(' && !pumvisible()
      return "\<Plug>(neosnippet_expand)"
    elseif neosnippet#jumpable()
          \ && getline('.')[col('.')-2] ==# '(' && !pumvisible() 
          \ && !neosnippet#expandable()
      return "\<plug>(neosnippet_jump)"
    elseif neosnippet#expandable_or_jumpable() && getline('.')[col('.')-2] !=#'('
      return "\<plug>(neosnippet_expand_or_jump)"
    elseif pumvisible()
      return "\<C-n>"
    elseif complete_parameter#jumpable(1) && getline('.')[col('.')-2] !=# ')'
      return "\<plug>(complete_parameter#goto_next_parameter)"
    else
      return "\<tab>"
    endif
  endfunction
elseif g:vim_snippet_engine ==# 'ultisnips'
  function! Vim#mapping#tab#i_tab() abort
    return "\<tab>"
  endfunction
endif

" vim:set et sw=2 cc=80:
