function! Vim#layers#denite#plugins() abort
  return [
        \ ['Shougo/denite.nvim',{ 'merged' : 0, 'loadconf' : 1}],
        \ ['pocari/vim-denite-emoji', {'merged' : 0}],
        \ ]
endfunction

function! Vim#layers#denite#config() abort
  call Vim#mapping#space#def('nnoremap', ['j', 'i'], 'Denite outline', 'jump to a definition in buffer', 1)
endfunction

" vim:set et sw=2 cc=80:
