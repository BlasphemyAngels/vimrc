scriptencoding utf-8
" Run the current file with rspec
map <Leader>rb :call VimuxRunCommand("clear;")<CR>
" Run command without sending a return
map <Leader>rq :call VimuxRunCommand("exit;")<CR>
