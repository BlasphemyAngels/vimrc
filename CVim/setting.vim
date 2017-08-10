scriptencoding utf-8
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
set foldmethod=indent
"set foldmethod=syntax
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
set mouse=v
"""设置文件被改动时自动载入"""
set autoread
"""处理未保存或只读文件时，弹出确认"""
set confirm
"""去掉输入错误的提示声音"""
set noeb
"""禁止生成临时文件"""
set nobackup
set noswapfile
"""搜索忽略大小写"""
set ignorecase

"让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
