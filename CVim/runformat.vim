scriptencoding utf-8
"""C,C++,python按F5编译运行"""
"map <F10> :call CompileRun()<CR>
nmap <Leader>m :w<CR>:call CompileRun()<CR>
func! CompileRun()
    exec "w"
    exec "!clear"
    exec "!echo '=======================Compile start============================='"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
    exec "!echo '=======================Comoile end==============================='"
endfunc
"""C,C++的调试"""
"map <F8> :call Rungdb()<CR>
"func! Rungdb()
    "exec "w"
    "exec "!g++ % -g -o %<"
    "exec "!gdb ./%<"
"endfunc
""代码格式优化"""
map <F6> :call FormartSrc()<CR><CR>
func! FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    exec "e! %"
endfunc
