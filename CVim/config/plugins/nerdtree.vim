scriptencoding utf-8
"""列出当前目录文件"""
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"""打开树状文件目录"""
map <C-F3> \be
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
"nerdtree setting
autocmd StdinReadPre * let s:std_in=1
""当打开vim且没有文件时自动打开NERDTREE"""
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | NERDTree | endif
"""只剩NERDTree时自动关闭"""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
