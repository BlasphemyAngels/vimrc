""
" @section Layers, layers
"   Vim support such layers:


""
" Load the {layer} you want. For all the layers Vim supports, see @section(layers).
" the second argv is the layer variable.
function! Vim#layers#load(layer, ...) abort
  if a:layer == '-l'
    call s:list_layers()
  endif
  if !exists('g:vim_plugin_groups')
    let g:vim_plugin_groups = []
  endif
  if index(g:vim_plugin_groups, a:layer) == -1
    call add(g:vim_plugin_groups, a:layer)
    if a:0 == 1 && type(a:1) == 4
      call Vim#layers#{a:layer}#set_variable(a:1)
    endif
  endif
  if a:0 > 0 && type(a:1) == 1 
    for l in a:000
      call Vim#layers#load(l)
    endfor
  endif
endfunction

function! s:list_layers() abort
  tabnew VimLayers
  nnoremap <buffer> q :q<cr>
  setlocal buftype=nofile bufhidden=wipe nobuflisted nolist noswapfile nowrap cursorline nospell
  setf VimLayerManager
  nnoremap <silent> <buffer> q :bd<CR>
  let info = [
        \ 'Vim layers:',
        \ '',
        \ ]
  call setline(1,info + s:find_layers())
  setl nomodifiable
endfunction

function! s:find_layers() abort
  let layers = Vim#util#globpath(&rtp, "autoload/Vim/layers/**/*.vim")
  let pattern = '/autoload/Vim/layers/'
  let rst = []
  for layer in layers
    if layer =~# pattern
      let name = layer[matchend(layer, pattern):-5]
      let status = (index(g:vim_plugin_groups, substitute(name, '/', '#','g')) != -1) ? 'loaded' : 'not loaded'
      if filereadable(expand('~/.Vim/docs/layers/' . name . '.md'))
        let website = 'https://vim.org/layers/' . name
      else
        let website = 'no exists'
      endif
      if status == 'loaded'
        call add(rst, '+ ' . name . ':' . repeat(' ', 25 - len(name)) . status . repeat(' ', 10) . website)
      else
        call add(rst, '- ' . name . ':' . repeat(' ', 21 - len(name)) . status . repeat(' ', 10) . website)
      endif
    endif
  endfor
  return rst
endfunction



" vim:set et sw=2:
