scriptencoding utf-8
let g:unite_source_menu_menus =
      \ get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.CustomKeyMaps = {'description':
      \ 'Custom mapped keyboard shortcuts                   [unite]<SPACE>'}
let g:unite_source_menu_menus.CustomKeyMaps.command_candidates =
      \ get(g:unite_source_menu_menus.CustomKeyMaps,'command_candidates', [])

function! Vim#mapping#_def(type,key,value,desc,...) abort
  exec a:type . ' ' . a:key . ' ' . a:value
  let description = '➤ '
        \. a:desc
        \. repeat(' ', 80 - len(a:desc) - len(a:key))
        \. a:key
  let cmd = len(a:000) > 0 ? a:000[0] : a:value
  call add(g:unite_source_menu_menus.CustomKeyMaps.command_candidates, [description,cmd])
endfunction

" a:1 unite desc
" a:2 unite cmd
" a:3 guide desc
" example  call Vim#mapping#def('nnoremap <silent>', 'gf', ':call zvim#gf()<CR>', 'Jump to a file under cursor', '')
function! Vim#mapping#def(type, key, value, ...) abort
  let feedkeys_mode = 'm'
  let map = split(a:type)[0]
  if map =~# 'nore'
    let feedkeys_mode = 'n'
  endif
  " TODO parse lhs and rhs, return list of key
  "let lhs = a:key
  "let rhs = a:value
  let gexe = a:value
  if a:value =~? '^<plug>'
    let gexe = '\' . a:value
  elseif a:value =~? ':.\+<cr>$'
    let gexe = substitute(gexe, '<cr>', "\<cr>", 'g')
    let gexe = substitute(gexe, '<CR>', "\<CR>", 'g')
    let gexe = substitute(gexe, '<Esc>', "\<Esc>", 'g')
  else
  endif
  if g:vim_enable_key_frequency
    exec a:type . ' <expr> ' . a:key . " Vim#mapping#frequency#update('" . a:key . "', '" . a:value . "')"
  else
    exec a:type . ' ' . a:key . ' ' . a:value
  endif
  if a:0 > 0
    let desc = a:1
    let description = '➤ '
          \ . desc
          \ . repeat(' ', 80 - len(desc) - len(a:key))
          \ . a:key
    let cmd = a:0 == 2 ? a:2 : a:value
    call add(g:unite_source_menu_menus.CustomKeyMaps.command_candidates, [description,cmd])
    if a:0 == 3
      " enable guide
      if a:key =~? '^<leader>'
        if len(a:key) > 9
          let group = a:key[8:8]
          if !has_key(g:_vim_mappings, group)
            let g:_vim_mappings[group] = {'name': 'new group'}
          endif
          call extend(g:_vim_mappings[group], {
                \ a:key[9:] : ['call feedkeys("' . gexe . '", "'
                \ . feedkeys_mode . '")', a:3]
                \ })
        elseif len(a:key) == 9
          call extend(g:_vim_mappings, {
                \ a:key[8:] : ['call feedkeys("' . gexe . '", "'
                \ . feedkeys_mode . '")', a:3]
                \ })

        endif
      endif
    endif
  endif
endfunction

function! Vim#mapping#shift_tab() abort
  return pumvisible() ? "\<C-p>" : "\<Plug>delimitMateS-Tab"
endfunction

function! Vim#mapping#tab() abort
  return Vim#mapping#tab#i_tab()
endfunction

function! Vim#mapping#enter() abort
  return Vim#mapping#enter#i_enter()
endfunction

function! Vim#mapping#gd() abort
  if !empty(Vim#mapping#gd#get())
    call call(Vim#mapping#gd#get(), [])
  else
    normal! gd
  endif
endfunction

function! Vim#mapping#clearBuffers() abort
  if confirm('Kill all other buffers?', "&Yes\n&No\n&Cancel") == 1
    let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val)')
    for i in blisted
      if i != bufnr('%')
        try 
          exe 'bw ' . i
        catch
        endtry
      endif
    endfor
  endif
endfunction

function! Vim#mapping#split_previous_buffer() abort
  if bufnr('#') == -1
    call Vim#util#echoWarn('There is no previous buffer')
  else
    split
    wincmd w
    e#
  endif

endfunction

function! Vim#mapping#vertical_split_previous_buffer() abort
  if bufnr('#') == -1
    call Vim#util#echoWarn('There is no previous buffer')
  else
    vsplit
    wincmd w
    e#
  endif
endfunction

function! Vim#mapping#close_current_buffer() abort
  let buffers = get(g:, '_vim_list_buffers', [])
  let bn = bufnr('%')
  let index = index(buffers, bn) 
  if index != -1
    if index == 0
      if len(buffers) > 1
        exe 'b' . buffers[1]
        exe 'bd' . bn
      else
        exe 'bd ' . bn
      endif
    elseif index > 0
      if index + 1 == len(buffers)
        exe 'b' . buffers[index - 1]
        exe 'bd' . bn
      else
        exe 'b' . buffers[index + 1]
        exe 'bd' . bn
      endif
    endif
  endif
endfunction

function! Vim#mapping#close_term_buffer(...) abort
  let buffers = get(g:, '_vim_list_buffers', [])
  let abuf = str2nr(g:_vim_termclose_abuf)
  let index = index(buffers, abuf)
  if index != -1
    if index == 0
      if len(buffers) > 1
        exe 'b' . buffers[1]
        exe 'bd!' . abuf
      else
        exe 'bd! ' . abuf
      endif
    elseif index > 0
      if index + 1 == len(buffers)
        exe 'b' . buffers[index - 1]
        exe 'bd!' . abuf
      else
        exe 'b' . buffers[index + 1]
        exe 'bd!' . abuf
      endif
    endif
  endif
endfunction

function! Vim#mapping#kill_visible_buffer_choosewin() abort
  ChooseWin
  let nr = bufnr('%')
  for i in range(1, winnr('$'))
    if winbufnr(i) == nr
      exe i .  'wincmd w'
      enew
    endif
  endfor
  exe 'bwipeout ' . nr
endfunction

function! Vim#mapping#menu(desc, key, cmd) abort
  let description = '➤ '
        \. a:desc
        \. repeat(' ', 80 - len(a:desc) - len(a:key))
        \. a:key
  call add(g:unite_source_menu_menus.CustomKeyMaps.command_candidates,
        \ [description ,
        \ a:cmd])
endfunction

" vim:set et sw=2 cc=80:
