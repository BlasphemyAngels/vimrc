let s:NUM = Vim#api#import('data#number')
fu! s:update_logo()
  if !exists('g:startify_custom_header') && !exists('g:_vim_welcome_banners')
    let g:startify_custom_header = [ ]
  elseif exists('g:_vim_welcome_banners')
    let g:startify_custom_header = g:_vim_welcome_banners[s:NUM.random(0, len(g:_vim_welcome_banners))]
  endif
endf
let g:startify_session_dir = $HOME .  '/.data/' . ( has('nvim') ? 'nvim' : 'vim' ) . '/session'
let g:startify_files_number = 6
let g:startify_list_order = [
      \ ['   My most recently used files in the current directory:'],
      \ 'dir',
      \ ['   My most recently used files:'],
      \ 'files',
      \ ['   These are my sessions:'],
      \ 'sessions',
      \ ['   These are my bookmarks:'],
      \ 'bookmarks',
      \ ]
"let g:startify_bookmarks = [ {'c': '~/.vimrc'}, '~/.zshrc' ]
let g:startify_update_oldfiles = 1
let g:startify_disable_at_vimenter = 1
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
"let g:startify_session_delete_buffers = 0
let g:startify_change_to_dir = 0
"let g:startify_change_to_vcs_root = 0  " vim-rooter has same feature
let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
      \ 'bundle/.*/doc',
      \ ]
augroup startify_map
  au!
  autocmd FileType startify nnoremap <buffer> <F2> <Nop>
  if !exists('g:startify_custom_header')
    autocmd FileType startify call <SID>update_logo()
  endif
  autocmd FileType startify setl scrolloff=0 nowrap
augroup END

if !exists('g:startify_custom_header')
  call s:update_logo()
endif
call Vim#mapping#space#def('nnoremap', ['a','s'], 'Startify | doautocmd WinEnter', 'fancy start screen',1)

" vim:set et sw=2:
