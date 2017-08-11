scriptencoding utf-8
"设置<leader>前缀键
let mapleader=";"
let localmapleader = "f"
"""rkdown to HTML"""
"nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
"nmap fi :!firefox %.html & <CR><CR>
"nmap \ \cc
"vmap \ \cc
"""将tab替换为空格"""
"nmap tt :%s/\t/    /g<CR>
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
nnoremap <leader>hw <C-W>s
nnoremap <leader>vw <C-W>v
nmap <Leader>M %
"""jshift tab pages""jw<C-W>j
"定义快捷键在结对符之间跳转
nmap <Leader>M %"
"""去空行"""
nnoremap <F2> :g/^\s*$/d<CR>
"""比较文件"""
nnoremap <C-F2> :vert diffsplit 


nnoremap <leader>ev :vsplit $MYVIMRC<cr>
"nnoremap <leader>sr :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
" vnoremap <leader>g" '<li"<Esc>'>a"<Esc>

nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
noremap <leader>; ;
"设置取消查找高亮
nnoremap <Leader>nh :nohl<CR>
nnoremap & i&ensp;&ensp;&ensp;<Esc>
"接口与实现之间转换
nmap <silent> <Leader>sw :FSHere<cr>
