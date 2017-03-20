set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/    
call vundle#rc()    
" let Vundle manage Vundle    
" required!     
Bundle 'gmarik/vundle'    
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
"Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
"Bundle 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-fugitive'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'TagHighlight'
Plugin 'xptemplate'
Plugin 'pydiction'
Plugin 'Color-Scheme-Explorer'
Plugin 'flazz/vim-colorschemes'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/unite.vim'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'tpope/vim-surround'
Plugin 'python-mode/python-mode'
Plugin 'bling/vim-airline'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
filetype plugin indent on
"设置<leader>前缀键
let mapleader=";"
"""侦测文件类型"""
filetype on
"""为特定文件类型载入相关缩进文件"""
filetype plugin indent on    
"""载入文件类型插件"""
filetype plugin on
"让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"开启语法高亮功能
syntax enable
"允许用指定语法高亮配色方案替换默认方案
syntax on
colorscheme molokai
"set background=dark
"colorscheme solarized
"禁止光标闪烁
set gcr=a:block-blinkon0
"自适应不同语言的智能缩进
filetype indent on
"vim-shell模式
set clipboard=unnamed
let g:SimpylFold_docstring_preview = 1
"""显示行号"""
set nu
"""不要图形按钮"""
set go=
"""高亮光标所在行"""
set cul
set cuc
"""语法高亮"""
let python_highlight_all=1
"""用浅色高亮当前行"""
autocmd InsertLeave * se nocul
"""用浅色高亮当前行"""
autocmd InsertEnter * se cul
"""设置标尺"""
set ruler
"禁止折行
set nowrap
"""输入的命令显示出来"""
set showcmd
"""光标移动到buffer的顶部和底部时保持3行距离"""
set scrolloff=3
"""不要闪烁"""
set novisualbell
"""启动显示状态行（1），总是显示状态行（2）"""
set laststatus=2
"""允许折叠"""
set foldenable
"""自动保存"""
set autowrite
"""凸显当前行"""
set cursorline
set cursorcolumn
"""隐藏工具栏"""
set guioptions-=T
"""隐藏菜单栏"""
set guioptions-=m
"禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
"""设置魔术"""
set magic
"""手动折叠"""
"set foldmethod=indent
set foldmethod=syntax
set foldlevel=99
"启动vim时关闭折叠代码
set nofoldenable
nnoremap <space> za
set cmdheight=1
"""去掉有关vi一致性模式，避免以前版本的一些bug"""
set nocompatible
"""显示中文帮助"""
if version > 603
    set helplang=cn
    set encoding=utf-8
endif
"if (has("gui_running"))
"    set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
"endif
set guifont=YaHei\ Consolas\ Hybrid\ 11.5
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
"""自动缩进"""
set autoindent
set cindent
"""Tab键的宽度"""
set tabstop=4
"""统一缩进为4"""
set softtabstop=4
set shiftwidth=4
set textwidth=79
"""使用空格代表制表符"""
set expandtab
"""在行和段开始处使用制表符"""
set smarttab
"""保存全局变量"""
set viminfo+=!
"""带有如下符号的单词不要被换行分割"""
set iskeyword+=_,$,@,%,#,-
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
" vim 自身命令行模式自动补全
set wildmenu
set mousemodel=popup
"""历史记录数"""
set history=1000
"""搜索逐字符高亮"""
set hlsearch
set incsearch
"""语言设置"""
set langmenu=zh_CN.UTF-8
"""新建.c, .h, .sh, .java, .py文件，自动插入文件头"""
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
"""定义函数SetTitle,自动插入文件头"""
func! SetTitle() 
    """如果文件类型为.sh文件""" 
    if &filetype == 'python'
        call setline(1, "# !/usr/bin/python3")
        call append(line("."), "# _*_coding: utf-8_*_")
    else
        if &filetype == 'sh' 
            call setline(1,"\#########################################################################") 
            call append(line("."), "\# File Name: ".expand("%")) 
            call append(line(".")+1, "\# Author: ma6174") 
            call append(line(".")+2, "\# mail: ma6174@163.com") 
            call append(line(".")+3, "\# Created Time: ".strftime("%Y-%m-%d %H:%M:%S")) 
            call append(line(".")+4, "\# Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
            call append(line(".")+5, "\#########################################################################") 
            call append(line(".")+6, "\#!/bin/bash") 
            call append(line(".")+7, "") 
        else 
            call setline(1, "/*************************************************************************") 
            call append(line("."), "    > File Name: ".expand("%")) 
            call append(line(".")+1, "    > Author: ma6174")
            call append(line(".")+2, "    > Mail: ma6174@163.com ") 
            call append(line(".")+3, "    > Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
            call append(line(".")+4, "    > Last modified: ".strftime("%Y-%m-%d %H:%M:%S"))
            call append(line(".")+5, " ************************************************************************/") 
            call append(line(".")+6, "")
        endif
        if &filetype == 'cpp'
            call append(line(".")+6, "#include<iostream>")
            call append(line(".")+7, "using namespace std;")
            call append(line(".")+8, "")
        endif
        if &filetype == 'c'
            call append(line(".")+6, "#include<stdio.h>")
            call append(line(".")+7, "")
        endif
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
"""markdown配置"""
"au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"""rkdown to HTML"""
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!firefox %.html & <CR><CR>
nmap \ \cc
vmap \ \cc
"""将tab替换为空格"""
nmap tt :%s/\t/    /g<CR>
"""键盘命令"""
":nmap <silent> <F9> <ESC>:Tlist<RETURN>
"将选中文本快复制到剪切板
vnoremap <Leader>y "+y
"将系统剪切版内容粘贴至vim
nmap <Leader>p "+p
"定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
"定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存当前窗口并退出
nmap <Leader>WQ :wa<CR>:q<CR>
"不做任何保存直接退出vim
nmap <Leader>Q :qa!<CR>
"依次遍历子窗口
nnoremap <Leader>nw <C-W><C-W>
"跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
"跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
"跳转至上方的窗口
nnoremap <Leader>kw <C-W>k
"跳转至下方的窗口
nnoremap <Leader>jw <C-W>j
"定义快捷键在结对符之间跳转
nmap <Leader>M %
"""jshift tab pages""jw<C-W>j
"定义快捷键在结对符之间跳转
nmap <Leader>M %"
set mouse=v
"""去空行"""
nnoremap <F2> :g/^\s*$/d<CR>
"""比较文件"""
nnoremap <C-F2> :vert diffsplit 
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <C-n> :CtrlPFunky<Cr>
"""列出当前目录文件"""
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"""打开树状文件目录"""
map <C-F3> \be  
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
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
"""代码格式优化"""
"map <F6> :call FormartSrc()<CR><CR>
"func! FormartSrc()
    "exec "w"
    "if &filetype == 'c'
        "exec "!astyle --style=ansi -a --suffix=none %"
    "elseif &filetype == 'cpp' || &filetype == 'hpp'
        "exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    "elseif &filetype == 'perl'
        "exec "!astyle --style=gnu --suffix=none %"
    "elseif &filetype == 'py'||&filetype == 'python'
        "exec "r !autopep8 -i --aggressive %"
    "elseif &filetype == 'java'
        "exec "!astyle --style=java --suffix=none %"
    "elseif &filetype == 'jsp'
        "exec "!astyle --style=gnu --suffix=none %"
    "elseif &filetype == 'xml'
        "exec "!astyle --style=gnu --suffix=none %"
    "else
        "exec "normal gg=G"
        "return
    "exec "e! %"
"endfunc
"""设置文件被改动时自动载入"""
set autoread
"""实用设置"""
"""当打开vim且没有文件时自动打开NERDTREE"""
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
endif
autocmd vimenter * if !argc() | NERDTree | endif
"""只剩NERDTree时自动关闭"""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"""处理未保存或只读文件时，弹出确认"""
set confirm
"""去掉输入错误的提示声音"""
set noeb
"""禁止生成临时文件"""
set nobackup
set noswapfile
"""搜索忽略大小写"""
set ignorecase
"""syntastic recommend setting"""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['pylint']
"let g:syntastic_python_pylint_args = '--disable=C0301,R0903,C0103,locally-disabled,invalid-name'
"let g:syntastic_error_symbol = get(g:, 'spacevim_error_symbol', '✖')
"let g:syntastic_warning_symbol = get(g:, 'spacevim_warning_symbol', '⚠')
"let g:syntastic_message_symbol = get(g:, 'spacevim_message_symbol', '➤')
"let g:syntastic_info_symbol = get(g:, 'spacevim_info_symbol', 'ℹ')
"let g:syntastic_vimlint_options = {
            "\'EVL102': 1 ,
            "\'EVL103': 1 ,
            "\'EVL205': 1 ,
            "\'EVL105': 1 ,
            "\}
"plugin pydictionsetting
let g:pydiction_location = '/home/ccl/some/path/here/pydiction/complete-dict'
"plugin vim-indent-guides setting
"随vim自启动
"let g:indent_guides_enable_on_vim_startup=1
"从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
"色块宽度
"let g:indent_guides_guide_size=1
"快捷键 i 可以开关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
"接口与实现之间转换
nmap <silent> <Leader>sw :FSHere<cr>
"vim-signature setting
let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'ToggleMarkAtLine'   :  "m.",
            \ 'PurgeMarksAtLine'   :  "m-",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarks'         :  "mda",
            \ 'PurgeMarkers'       :  "m<BS>",
            \ 'GotoNextLineAlpha'  :  "']",
            \ 'GotoPrevLineAlpha'  :  "'[",
            \ 'GotoNextSpotAlpha'  :  "`]",
            \ 'GotoPrevSpotAlpha'  :  "`[",
            \ 'GotoNextLineByPos'  :  "]'",
            \ 'GotoPrevLineByPos'  :  "['",
            \ 'GotoNextSpotByPos'  :  "mn",
            \ 'GotoPrevSpotByPos'  :  "mp",
            \ 'GotoNextMarker'     :  "[+",
            \ 'GotoPrevMarker'     :  "[-",
            \ 'GotoNextMarkerAny'  :  "]=",
            \ 'GotoPrevMarkerAny'  :  "[=",
            \ 'ListLocalMarks'     :  "ms",
            \ 'ListLocalMarkers'   :  "m?"
            \ }
"jedi-vim setting
"let g:jedi#auto_initialization = 1                                                                                                         
"let g:jedi#completions_enabled = 1                                                                                                         
"let g:jedi#use_tabs_not_buffers = 1                                                                                                        
"let g:jedi#auto_vim_configuration = 0                                                                                                      
"let g:jedi#use_splits_not_buffers = "left"                                                                                  
"let g:jedi#popup_on_dot = 1                                                                                                                
"let g:jedi#popup_select_first = 0   
"nerdtree setting
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"tagbar setting
nmap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_width = 30
"TaskList setting
map <leader>td <Plug>TaskList
"easymotion setting
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
"gundo setting
nnoremap <Leader>u :GundoToggle<CR>
nnoremap <F7> :GundoToggle<CR>
"设置取消查找高亮
nnoremap <Leader>nh :nohl<CR>
"python mode setting
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_goto_definition_bind = '<leader>g'
let g:pymode_rope_rename_bind = '<leader>rr'
let g:pymode_rope_rename_module_bind = '<leader>r1r'
"let g:pymode_rope_project_root = "/home/ccl/Documents/doc/pro/pyanalysis/soccer"
"let g:pymode_virtualenv = 1
"let g:pymode_virtualenv_path = $VIRTUAL_ENV
let g:pymode_python = 'python3'
"let g:pymode_rope_organize_imports_bind = '<leader>ro'
"let g:pymode_rope_autoimport_bind = '<leader>ra'
"let g:pymode_rope_autoimport = 1
"indent-line setting
"let g:indentLine_setColors = 0
"airline setting
let g:airline_theme='molokai'
"let g:airline_theme='solarized'
"vimfiler setting
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:block-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
noremap <silent> <F4> :call OpenVimfiler()<CR>
function! OpenVimfiler() abort
    if bufnr('vimfiler') == -1
        VimFiler
        AirlineRefresh
        wincmd p
        if &filetype !=# 'startify'
            IndentLinesToggle
            IndentLinesToggle
        endif
        wincmd p
    else
        VimFiler
        AirlineRefresh
    endif
endfunction
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_restore_alternate_file = 1
let g:vimfiler_tree_indentation = 1
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▼'
let g:vimfiler_tree_closed_icon = '▷'
let g:vimfiler_file_icon = ''
let g:vimfiler_readonly_file_icon = '*'
let g:vimfiler_marked_file_icon = '√'
"let g:vimfiler_preview_action = 'auto_preview'
let g:vimfiler_ignore_pattern = [
            \ '^\.git$',
            \ '^\.DS_Store$',
            \ '^\.init\.vim-rplugin\~$',
            \ '^\.netrwhist$',
            \ '\.class$'
            \]

if has('mac')
    let g:vimfiler_quick_look_command =
                \ '/Applications//Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
else
    let g:vimfiler_quick_look_command = 'gloobus-preview'
endif

call vimfiler#custom#profile('default', 'context', {
            \ 'explorer' : 1,
            \ 'winwidth' : 30,
            \ 'winminwidth' : 30,
            \ 'toggle' : 1,
            \ 'columns' : 'type',
            \ 'auto_expand': 1,
            \ 'direction' : 'rightbelow',
            \ 'parent': 0,
            \ 'explorer_columns' : 'type',
            \ 'status' : 1,
            \ 'safe' : 0,
            \ 'split' : 1,
            \ 'hidden': 1,
            \ 'no_quit' : 1,
            \ 'force_hide' : 0,
            \ })
augroup vfinit
    au!
    autocmd FileType vimfiler call s:vimfilerinit()
    autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') |
                \ q | endif
augroup END
function! s:vimfilerinit()
    set nonumber
    set norelativenumber

    silent! nunmap <buffer> <Space>
    silent! nunmap <buffer> <C-l>
    silent! nunmap <buffer> <C-j>
    silent! nunmap <buffer> E
    silent! nunmap <buffer> gr
    silent! nunmap <buffer> gf
    silent! nunmap <buffer> -
    silent! nunmap <buffer> s

    nnoremap <silent><buffer> gr  :<C-u>Denite grep:<C-R>=<SID>selected()<CR> -buffer-name=grep<CR>
    nnoremap <silent><buffer> gf  :<C-u>Denite file_rec:<C-R>=<SID>selected()<CR><CR>
    nnoremap <silent><buffer> gd  :<C-u>call <SID>change_vim_current_dir()<CR>
    nnoremap <silent><buffer><expr> sg  vimfiler#do_action('vsplit')
    nnoremap <silent><buffer><expr> sv  vimfiler#do_action('split')
    nnoremap <silent><buffer><expr> st  vimfiler#do_action('tabswitch')
    nmap <buffer> gx     <Plug>(vimfiler_execute_vimfiler_associated)
    nmap <buffer> '      <Plug>(vimfiler_toggle_mark_current_line)
    nmap <buffer> v      <Plug>(vimfiler_quick_look)
    nmap <buffer> p      <Plug>(vimfiler_preview_file)
    nmap <buffer> V      <Plug>(vimfiler_clear_mark_all_lines)
    nmap <buffer> i      <Plug>(vimfiler_switch_to_history_directory)
    nmap <buffer> <Tab>  <Plug>(vimfiler_switch_to_other_window)
    nmap <buffer> <C-r>  <Plug>(vimfiler_redraw_screen)
endf
"mapping the Caps Lock to the Ctrl need install the xorg-xmodmap
"au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"##### auto fcitx  ###########
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx-remote")
   if s:input_status != 2 && g:input_toggle == 1
      let l:a = system("fcitx-remote -o")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()
"##### auto fcitx end ######
