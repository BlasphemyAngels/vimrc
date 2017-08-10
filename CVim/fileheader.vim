scriptencoding utf-8
"""新建.c, .h, .sh, .java, .py文件，自动插入文件头"""
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
"""定义函数SetTitle,自动插入文件头"""
func! SetTitle()
    """如果文件类型为.sh文件"""
    if  &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: caochenglong")
        call append(line(".")+2, "\# mail: caochenglong@163.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".")+4, "\# Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".")+5, "\#########################################################################")
        call append(line(".")+6, "\#!/bin/bash")
        call append(line(".")+7, "")
    elseif &filetype == 'python'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: caochenglong")
        call append(line(".")+2, "\# mail: caochenglong@163.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".")+4, "\# Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".")+5, "\#########################################################################")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: caochenglong")
        call append(line(".")+2, "    > Mail: caochenglong@163.com ")
        call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".")+4, "    > Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
        call append(line(".")+5, " ************************************************************************/")
        call append(line(".")+6, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "#include<cstdio>")
        call append(line(".")+8, "#include<cstring>")
        call append(line(".")+9, "#include<ctype.h>")
        call append(line(".")+10, "#include<algorithm>")
        call append(line(".")+11, "#include<climits>")
        call append(line(".")+12, "using namespace std;")
        call append(line(".")+13, "")
        call append(line(".")+14, "int main(void){")
        call append(line(".")+15, "    return 0;")
        call append(line(".")+16, "}")
        call append(line(".")+17, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if &filetype == 'python'
          call append(line(".")+6, "# !/usr/bin/python3")
          call append(line(".")+7, "# _*_coding: utf-8_*_")
    endif
endfunc
autocmd BufNewFile * normal G
autocmd BufWrite,BufWritePre,FileWritePre *.[ch],*.sh,*.cpp,*.py,*.java ks|call LastModified()|'s
func! LastModified()
    if line("$") > 20
        let l = 20
    else
        let l = line("$")
    endif
    exe "1,".l."g/Last modified: /s/Last modified: .*/Last modified:".
                \strftime("%Y-%m-%d %H:%M:%S" ) . "/e"
endfunc
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif
