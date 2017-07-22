" Note: Skip initialization for vim-tiny or vim-small.
if 1
  execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/main.vim'
endif
" vim:set et sw=2
"


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

autocmd FileType html,htmldjango,css,scss EmmetInstall
" autocmd BufWrite, BufRead *.html,*.css :EmmetInstall
"
" " set splitbelow
" set splitright
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

"将选中文本快复制到剪切板
" vnoremap <Leader>y "+y
"将系统剪切版内容粘贴至vim
" nmap <Leader>p "+p
"定义快捷键关闭当前分割窗口
" nmap <Leader>q :q<CR>
"定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存当前窗口并退出
nmap <Leader>WQ :wa<CR>:q<CR>
"不做任何保存直接退出vim
nmap <Leader>Q :qa!<CR>
"依次遍历子窗口
" nnoremap <Leader>nw <C-W><C-W>
"跳转至右方的窗口
" nnoremap <Leader>lw <C-W>l
" "跳转至左方的窗口
" nnoremap <Leader>hw <C-W>h
" "跳转至上方的窗口
" nnoremap <Leader>kw <C-W>k
" "跳转至下方的窗口
" nnoremap <Leader>jw <C-W>j
" "定义快捷键在结对符之间跳转
" nnoremap <leader>hw <C-W>s
" nnoremap <leader>vw <C-W>v
" nmap <Leader>M %

"let g:spacevim_language = 'en_CA.utf8'
"let g:spacevim_language = 'zh_CN.UTF-8'
:nnoremap & i&ensp;&ensp;&ensp;<Esc>

"filetype plugin on

"set langmenu=zh_CN.UTF-8

" func! SetPythonTitle()
"     set foldmethod=indent
"     set foldlevel=99
"     call setline(1, "\#########################################################################")
"     call setline(2, "\# File Name: ".expand("%"))
"     call setline(3, "\# Author: ChengLong Cao")
"     call setline(4, "\# mail: notblaspheme@gmail.com")
"     call setline(5, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
"     call setline(6, "\# Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
"     call setline(7, "\#########################################################################")
"     call setline(8, "")
"     call setline(9, "# !/usr/bin/python")
"     call setline(10, "# _*_coding: utf-8_*_")
"     call setline(11, "")
" endfunc
"
" func! SetCppTitle()
"     set foldmethod=syntax
"     set foldlevel=99
"     call setline(1, "/*************************************************************************")
"     call setline(2, "    > File Name: ".expand("%"))
"     call setline(3, "    > Author: ChengLong Cao")
"     call setline(4, "    > Mail: notblaspheme@gmail.com ")
"     call setline(5, "    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
"     call setline(6, "    > Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
"     call setline(7, " ************************************************************************/")
"     call setline(8, "#include<iostream>")
"     call setline(9, "#include<cstdio>")
"     call setline(10, "#include<cstring>")
"     call setline(11, "#include<ctype.h>")
"     call setline(12, "#include<algorithm>")
"     call setline(13, "#include<climits>")
"     call setline(14, "using namespace std;")
"     call setline(15, "")
" endfunc
"
" func! SetCTitle()
"     set foldmethod=syntax
"     set foldlevel=99
"     call setline(1, "/*************************************************************************")
"     call setline(2, "    > File Name: ".expand("%"))
"     call setline(3, "    > Author: ChengLong Cao")
"     call setline(4, "    > Mail: notblaspheme@gmail.com ")
"     call setline(5, "    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
"     call setline(6, "    > Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
"     call setline(7, " ************************************************************************/")
"     call setline(8, "#include<stdio.h>")
" endfunc
" func! SetShTitle()
"     set foldmethod=indent
"     set foldlevel=99
"     call setline(1,"\#########################################################################")
"     call setline(2, "\# File Name: ".expand("%"))
"     call setline(3, "\# Author: ChengLong Cao")
"     call setline(4, "\# mail: notblaspheme@gmail.com")
"     call setline(5, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
"     call setline(6, "\# Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
"     call setline(7, "\#########################################################################")
"     call setline(8, "\#!/bin/bash")
" endfunc
" autocmd FileType python call SetPythonTitle()
" autocmd FileType sh call SetShTitle()
" autocmd FileType c call SetCTitle()
" autocmd FileType cpp call SetCppTitle()
" func! LastModified()
"     if line("$") > 20
"         let l = 20
"     else
"         let l = line("$")
"     endif
"     exe "1,".l."g/Last modified: /s/Last modified: .*/Last modified:".
"                 \strftime("%Y-%m-%d %H:%M:%S" ) . "/e"
" endfunc
" " au BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py call SetTitle()
" autocmd BufWrite,BufWritePre,FileWritePre *.[ch],*.sh,*.cpp,*.py,*.java ks|call LastModified()|'s
" autocmd BufNewFile * normal G
let g:limelight_default_coefficient = 0.7

"python debug
python << EOF
import time
import vim
def SetBreakpoint():
    nLine = int( vim.eval( 'line(".")'))
    strLine = vim.current.line
    i = 0
    strWhite = ""
    while strLine[i] == ' ' or strLine[i] == "\t":
        i += 1
        strWhite += strLine[i]
    vim.current.buffer.append(
       "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)
    for strLine in vim.current.buffer:
        if strLine == "import pdb":
            break
        else:
            vim.current.buffer.append( 'import pdb', 9)
            vim.command( 'normal j1')
            break
vim.command( 'map <leader>x :py SetBreakpoint()<cr>')

def RemoveBreakpoints():
    nCurrentLine = int( vim.eval( 'line(".")'))
    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == 'import pdb' or strLine.lstrip()[:15] == 'pdb.set_trace()':
            nLines.append( nLine)
        nLine += 1
    nLines.reverse()
    for nLine in nLines:
        vim.command( 'normal %dG' % nLine)
        vim.command( 'normal dd')
        if nLine < nCurrentLine:
            nCurrentLine -= 1
    vim.command( 'normal %dG' % nCurrentLine)
    vim.command( 'map <leader>a :py RemoveBreakpoints()<cr>')
EOF

" function! Random()
"   return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:2])
" endfunction

let s:NUM = SpaceVim#api#import('data#number')

let welcome_banners = [
        \ [
        \ "                           .::::.                                      ",
        \ "                         .::::::::.                                    ",
        \ "                        :::::::::::                                    ",
        \ "                     ..:::::::::::'                                    ",
        \ "                  '::::::::::::'                                       ",
        \ "                    .::::::::::                                        ",
        \ "               '::::::::::::::..                                       ",
        \ "                    ..::::::::::::.                                    ",
        \ "                  ``::::::::::::::::                                   ",
        \ "                   ::::``:::::::::'        .:::.                       ",
        \ "                  ::::'   ':::::'       .::::::::.                     ",
        \ "                .::::'      ::::     .:::::::'::::.                    ",
        \ "               .:::'       :::::  .:::::::::' ':::::.                  ",
        \ "              .::'        :::::.:::::::::'      ':::::.                ",
        \ "             .::'         ::::::::::::::'         ``::::.              ",
        \ "         ...:::           ::::::::::::'              ``::.             ",
        \ "        ```` ':.          ':::::::::'                  ::::..          ",
        \ "                           '.:::::'                    ':'````..       ",
        \],
        \[
        \ '                             _ooOoo_                             ',
        \ '                            o8888888o                                                           ',
        \ '                            88" . "88                   佛曰:                                   ',
        \ '                            (| -_- |)                        写字楼里写字间，写字间里程序员；   ',
        \ '                            O\  =  /O                            ',
        \ '                         ____/`---"\____                     程序人员写程序，又拿程序换酒钱。   ',
        \ '                       ."  \\|     |//  `.                       ',
        \ '                      /  \\|||  :  |||//  \                  酒醒只在网上坐，酒醉还来网下眠；   ',
        \ '                     /  _||||| -:- |||||-  \                     ',
        \ '                     |   | \\\  -  /// |   |                 酒醉酒醒日复日，网上网下年复年。   ',
        \ '                     | \_|  ''\---/''  |   |                     ',
        \ '                     \  .-\__  `-`  ___/-. /                 但愿老死电脑间，不愿鞠躬老板前；   ',
        \ '                   ___`. ."  /--.--\  `. . __                    ',
        \ '                ."" "<  `.___\_<|>_/___."  >""".             奔驰宝马贵者趣，公交自行程序员。   ',
        \ '               | | :  `- \`.;`\ _ /`;.`/ - ` : | |               ',
        \ '               \  \ `-.   \_ __\ /__ _/   .-` /  /           别人笑我忒疯癫，我笑自己命太贱；   ',
        \ '          ======`-.____`-.___\_____/___.-`____.-"======          ',
        \ '                             `=---="                         不见满街漂亮妹，哪个归得程序员？   ',
        \ '         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^           ',
        \ '                       Buddha Bless, No Bug !                    ',
        \],
        \[
        \ '',
        \ '',
        \ '                                         江城子 . 程序员之歌',
        \ '',
        \ '                                   十年生死两茫茫，写程序，到天亮。',
        \ '',
        \ '                                         千行代码，Bug何处藏。',
        \ '',
        \ '                                   纵使上线又怎样，朝令改，夕断肠。',
        \ '',
        \ '',
        \ '                                   领导每天新想法，天天改，日日忙。',
        \ '',
        \ '                                         相顾无言，惟有泪千行。',
        \ '',
        \ '                                   每晚灯火阑珊处，夜难寐，加班狂。',
        \],
        \[
        \ "                              .--,       .--,                                           ",
        \ "                             ( (  \\.---./  ) )                                          ",
        \ "                              '.__/o   o\\__.'                                           ",
        \ "                                 {=  ^  =}                                              ",
        \ "                                  >  -  <                                               ",
        \ "                                 /       \\                                              ",
        \ "                                //       \\\\                                             ",
        \ "                               //|   .   |\\\\                                            ",
        \ "                               ''\\       /''_.-~^`'-.                                   ",
        \ "                                  \\  _  /--'         `                                  ",
        \ "                                ___)( )(___                                             ",
        \ "                               (((__) (__)))    高山仰止,景行行止.虽不能至,心向往之。   ",
        \ ],
        \[
        \ '     ┌───┐   ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┐                   ',
        \ '     │Esc│   │ F1│ F2│ F3│ F4│ │ F5│ F6│ F7│ F8│ │ F9│F10│F11│F12│ │P/S│S L│P/B│  ┌┐    ┌┐    ┌┐   ',
        \ '     └───┘   └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┘  └┘    └┘    └┘   ',
        \ '     ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐ ┌───┬───┬───┐ ┌───┬───┬───┬───┐ ',
        \ '     │~ `│! 1│@ 2│# 3│$ 4│% 5│^ 6│& 7│* 8│( 9│) 0│_ -│+ =│ BacSp │ │Ins│Hom│PUp│ │N L│ / │ * │ - │ ',
        \ '     ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤ ├───┼───┼───┤ ├───┼───┼───┼───┤ ',
        \ '     │ Tab │ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │{ [│} ]│ | \ │ │Del│End│PDn│ │ 7 │ 8 │ 9 │   │ ',
        \ '     ├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴─────┤ └───┴───┴───┘ ├───┼───┼───┤ + │ ',
        \ '     │ Caps │ A │ S │ D │ F │ G │ H │ J │ K │ L │: ;│" ''│ Enter  │               │ 4 │ 5 │ 6 │   │ ',
        \ '     ├──────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────────┤     ┌───┐     ├───┼───┼───┼───┤ ',
        \ '     │ Shift  │ Z │ X │ C │ V │ B │ N │ M │< ,│> .│? /│  Shift   │     │ ↑ │     │ 1 │ 2 │ 3 │   │ ',
        \ '     ├─────┬──┴─┬─┴──┬┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬────┬────┤ ┌───┼───┼───┐ ├───┴───┼───┤ E││ ',
        \ '     │ Ctrl│    │Alt │         Space         │ Alt│    │    │Ctrl│ │ ← │ ↓ │ → │ │   0   │ . │←─┘│ ',
        \ '     └─────┴────┴────┴───────────────────────┴────┴────┴────┴────┘ └───┴───┴───┘ └───────┴───┴───┘ ',
        \ '',
        \],
        \[
        \'                     **************************************************************',
        \'                     *                                                            *',
        \'                     *   .=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-.       *',
        \'                     *    |                     ______                     |      *',
        \'                     *    |                  .-"      "-.                  |      *',
        \'                     *    |                 /            \                 |      *',
        \'                     *    |     _          |              |          _     |      *',
        \'                     *    |    ( \         |,  .-.  .-.  ,|         / )    |      *',
        \'                     *    |     > "=._     | )(__/  \__)( |     _.=" <     |      *',
        \'                     *    |    (_/"=._"=._ |/     /\     \| _.="_.="\_)    |      *',
        \'                     *    |           "=._"(_     ^^     _)"_.="           |      *',
        \'                     *    |               "=\__|IIIIII|__/="               |      *',
        \'                     *    |              _.="| \IIIIII/ |"=._              |      *',
        \'                     *    |    _     _.="_.="\          /"=._"=._     _    |      *',
        \'                     *    |   ( \_.="_.="     `--------`     "=._"=._/ )   |      *',
        \'                     *    |    > _.="                            "=._ <    |      *',
        \'                     *    |   (_/                                    \_)   |      *',
        \'                     *    |                                                |      *',
        \'                     *    ''-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=''    *',
        \'                     *                                                            *',
        \'                     *           LASCIATE OGNI SPERANZA, VOI CH''ENTRATE          *',
        \'                     **************************************************************',
        \],
        \[
        \'                                 出生',
        \'                                  ||',
        \'                                  ||',
        \'                                 \  /',
        \'                                  \/',
        \'                                 青年',
        \'                            （年龄 = rand(20,25))）    《==============',
        \'                                  ||                                 ||',
        \'                                  ||                                 ||',
        \'                                  ||          祝福所有开发工作者     ||',
        \'                                  ||             永远年轻            ||',
        \'                                  ||                                 ||',
        \'                                 \  /                                ||',
        \'                                  \/                                 ||',
        \'                            （20 <= 年龄 <= 25）        ===============',
        \'                                  ||',
        \'                                  ||',
        \'                                 \  /',
        \'                                  \/',
        \'                                等死状态',
        \]
        \]

let g:startify_custom_header = welcome_banners[s:NUM.random(0, len(welcome_banners))]

vnoremap <leader>tv :<C-u>Ydv<CR>
nnoremap <leader>tc :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>
" vnoremap <silent> <C-T> :<C-u>Ydv<CR>
" nnoremap <silent> <C-T> :<C-u>Ydc<CR>
" noremap <leader>yd :<C-u>Yde<CR>

        " \[
        " \'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHAAAAAAAAAAAAAAAAAAAAAA',
        " \'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHAHBBHHHAAAAAAAAAAAAAAAAA',
        " \'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHBX1;r59XAHBBHHAAAAAAAAAAAAA',
        " \'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHBX1.     .:r59XAHBBHAHAAAAAHA',
        " \'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHX1.            .:rh9XHAHAAAAHA',
        " \'AAAAAAAAAAAAAAAAAAHHAAAAAAAAAAAAAAAAAAAAAAAAAHHBX1.                   rHHHAAAAHA',
        " \'AAAAAAAAAAAAAAAAHHHHAAAAAAAAAAAAAAAAAAAAAAHAHHX1.                     iHHHHAAAAA',
        " \'AAAAAAAAAAAAAHHBHAXABHHAHAAAAAAAAAAAAAAAAHHBX1.                       rAHHHAAAAA',
        " \'AAAAAAAAAAHAHAGSs: :hGHBHAAAHAAAAAAHAAAHHBXs.                         rAHHHAAAAA',
        " \'AAAAAAAAAAAHX;       .r3&BHHAHAAHAAAHHHHG1.                           rAHHHAAAAA',
        " \'AAAAAAAAAAAHG.          ,1GHBHAAHHAHHHGs.              ;,             rAHHHAAAAA',
        " \'AAAAAAAAAHHHG,             iS&HHHHHHGs              ,1GHr             rAHHHAAAAA',
        " \'AAAAAAAAAAAHG,    ih,        .s9AHGs.            .i3&HBAi             rAHHHAAAAA',
        " \'AAAAAAAAAAAHG,    sB&h,         ;r.            :hGHBHAHAi             rAHHHAAAAA',
        " \'AAAAAAAAAAAHG,    rHHB&h,                   .r9ABHHAAAHAi             rAHHHAAAAA',
        " \'AAAAAAAAAAAHG,    rHHHHB&5:              .i5XHBHHHAAAAHAi             rAHHHAAAAA',
        " \'AAAAAAAAAAAHG,    rHHHAHBB9,             s&MBHAAAAAAHAHAi             rAHHHAAAAA',
        " \'AAAAAAAAAAAHG,    rHHHHHGr.               ,s8ABHAAAAAAHAi             rAHHHAAAAA',
        " \'AAAAAAAAAAAHG,    rHHH8r                     ;5XHHHAHAHAi             rAHHHAAAAA',
        " \'AAAAAAAAAAAHG,    sHGr         .rh,            .r3AHHHHAr             rAHHHAAAAA',
        " \'AAAAAAAAAAAHG,    ;r         ;5XHB&5,             :hGHBHi             rAHHHAAAAA',
        " \'AAAAAAAAAAAHG,            ,s8ABHHHHB&5,              iS&r             rAHHHAAAAA',
        " \'AAAAAAAAAHAHG.          iS&HHHHHAAHHHB&5,              ,.             rAHHHAAAAA',
        " \'AAAAAAAAHHAH&s,      :hGHBHAAAAAAAAAAAHB&5:                           rAHHHAAAAA',
        " \'AAAAAAAAHHAAHH&85r:i3&BHHAAAAAAAAAAAAHAHHBAS:                         rAHHHAAAAA',
        " \'AAAAAAAAAAHHAHHHBHAHBHHAAAAAAAAAAAHAAAAHAAHB&S:                       rAHHHAAAAA',
        " \'AAAAAAAAAAAAAAAAAHHHAAAAAAAAAAAAAAAAAAAAAAHAHBAS:                     iAAAAHAAAA',
        " \'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHAHHAS:                   sHAAAAAAAA',
        " \'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHBAS:            ,rh9GAAAAAAAAAA',
        " \'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHAHBAS:    .:rh3GAHBBBHAAAAAAAAA',
        " \'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHAAAAAAHHBASrh9XAHBBHHHAAHHAAAAAAAAA',
        " \'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHBHBHHHAAAAAAAAAAAAAAAAAAA',
        " \]
        " \[
        " \'                       :: ',
        " \'                      :;J7, :,                        ::;7:',
        " \'                      ,ivYi, ,                       ;LLLFS:',
        " \'                      :iv7Yi                       :7ri;j5PL',
        " \'                     ,:ivYLvr                    ,ivrrirrY2X,',
        " \'                     :;r@Wwz.7r:                :ivu@kexianli.',
        " \'                    :iL7::,:::iiirii:ii;::::,,irvF7rvvLujL7ur',
        " \'                   ri::,:,::i:iiiiiii:i:irrv177JX7rYXqZEkvv17',
        " \'                ;i:, , ::::iirrririi:i:::iiir2XXvii;L8OGJr71i',
        " \'              :,, ,,:   ,::ir@mingyi.irii:i:::j1jri7ZBOS7ivv,',
        " \'                 ,::,    ::rv77iiiriii:iii:i::,rvLq@huhao.Li',
        " \'             ,,      ,, ,:ir7ir::,:::i;ir:::i:i::rSGGYri712:',
        " \'           :::  ,v7r:: ::rrv77:, ,, ,:i7rrii:::::, ir7ri7Lri',
        " \'          ,     2OBBOi,iiir;r::        ,irriiii::,, ,iv7Luur:',
        " \'        ,,     i78MBBi,:,:::,:,  :7FSL: ,iriii:::i::,,:rLqXv::',
        " \'        :      iuMMP: :,:::,:ii;2GY7OBB0viiii:i:iii:i:::iJqL;::',
        " \'       ,     ::::i   ,,,,, ::LuBBu BBBBBErii:i:i:i:i:i:i:r77ii',
        " \'      ,       :       , ,,:::rruBZ1MBBqi, :,,,:::,::::::iiriri:',
        " \'     ,               ,,,,::::i:  @arqiao.       ,:,, ,:::ii;i7:',
        " \'    :,       rjujLYLi   ,,:::::,:::::::::,,   ,:i,:,,,,,::i:iii',
        " \'    ::      BBBBBBBBB0,    ,,::: , ,:::::: ,      ,,,, ,,:::::::',
        " \'    i,  ,  ,8BMMBBBBBBi     ,,:,,     ,,, , ,   , , , :,::ii::i::',
        " \'    :      iZMOMOMBBM2::::::::::,,,,     ,,,,,,:,,,::::i:irr:i:::,',
        " \'    i   ,,:;u0MBMOG1L:::i::::::  ,,,::,   ,,, ::::::i:i:iirii:i:i:',
        " \'    :    ,iuUuuXUkFu7i:iii:i:::, :,:,: ::::::::i:i:::::iirr7iiri::',
        " \'    :     :rk@Yizero.i:::::, ,:ii:::::::i:::::i::,::::iirrriiiri::,',
        " \'     :      5BMBBBBBBSr:,::rv2kuii:::iii::,:i:,, , ,,:,:i@petermu.,',
        " \'          , :r50EZ8MBBBBGOBBBZP7::::i::,:::::,: :,:,::i;rrririiii::',
        " \'              :jujYY7LS0ujJL7r::,::i::,::::::::::::::iirirrrrrrr:ii:',
        " \'           ,:  :@kevensun.:,:,,,::::i:i:::::,,::::::iir;ii;7v77;ii;i,',
        " \'           ,,,     ,,:,::::::i:iiiii:i::::,, ::::iiiir@xingjief.r;7:i,',
        " \'        , , ,,,:,,::::::::iiiiiiiiii:,:,:::::::::iiir;ri7vL77rrirri::',
        " \'         :,, , ::::::::i:::i:::i:i::,,,,,:,::i:i:::iir;@Secbone.ii:::',
        " \],
" //你可能会认为你读得懂以下的代码。但是你不会懂的，相信我吧。
"
" //要是你尝试玩弄这段代码的话，你将会在无尽的通宵中不断地咒骂自己为什么会认为自己聪明到可以优化这段代码。
" //so，现在请关闭这个文件去玩点别的吧。
"
" //程序员1（于2010年6月7日）：在这个坑临时加入一些调料
" //程序员2（于2011年5月22日）：临你个屁啊
" //程序员3（于2012年7月23日）：楼上都是狗屎，鉴定完毕
" //程序员4（于2013年8月2日）：fuck 楼上，三年了，这坑还在！！！
" //程序员5（于2014年8月21日）：哈哈哈，这坑居然坑了这么多人，幸好我也不用填了，系统终止运行了，you're died

" ## Safety pig has arrived!
" ##                               _
" ##  _._ _..._ .-',     _.._(`))
" ## '-. `     '  /-._.-'    ',/
" ##    )         \            '.
" ##   / _    _    |             \
" ##  |  a    a    /              |
" ##  \   .-.                     ;
" ##   '-('' ).-'       ,'       ;
" ##      '-;           |      .'
" ##         \           \    /
" ##         | 7  .__  _.-\   \
" ##         | |  |  ``/  /`  /
" ##        /,_|  |   /,_/   /
" ##           /,_/      '`-'
" ##
"
set foldmethod=syntax
set foldlevel=99
nnoremap <leader>cq i要是你尝试玩弄这段代码的话，你将会在无尽的通宵中不断地咒骂自己为什么会认为自己聪明到可以优化这段代码。so，现在请关闭这个文件去玩点别的吧。<Esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sr :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
inoremap <Backspace> <nop>
" vnoremap <leader>g" '<li"<Esc>'>a"<Esc>

nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
noremap <leader>; ;
autocmd FileType python noremap <leader>ep :call Autopep8()<CR>
let g:autopep8_disable_show_diff=0
set foldmethod=indent
