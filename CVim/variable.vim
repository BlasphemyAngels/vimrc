scriptencoding utf-8
let g:vim_wildignore
      \ = '*/tmp/*,*.so,*.swp,*.zip,*.class,tags,*.jpg,
      \*.ttf,*.TTF,*.png,*/target/*,
      \.git,.svn,.hg,.DS_Store,*.svg'

" Set the error symbol for Vim's syntax maker. Default is '✖'.
" >
"   let g:vim_error_symbol = '+'
" <
let g:vim_error_symbol            = '✖'
""
" Set the warning symbol for Vim's syntax maker. Default is '⚠'.
" >
"   let g:vim_warning_symbol = '!'
" <
let g:vim_warning_symbol          = '⚠'
