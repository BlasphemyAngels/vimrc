
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.vim/plugins//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/hadis/.vim/plugins/')
  call dein#begin('/home/hadis/.vim/plugins/')

  " Let dein manage dein
  " Required:
  call dein#add('/home/hadis/.vim/plugins//repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  "call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

