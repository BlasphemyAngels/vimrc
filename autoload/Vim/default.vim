scriptencoding utf-8
function! Vim#default#SetOptions() abort
  " basic vim settiing
  if has('gui_running')
    set guioptions-=m " Hide menu bar.
    set guioptions-=T " Hide toolbar
    set guioptions-=L " Hide left-hand scrollbar
    set guioptions-=r " Hide right-hand scrollbar
    set guioptions-=b " Hide bottom scrollbar
    set showtabline=0 " Hide tabline
    set guioptions-=e " Hide tab
    if WINDOWS()
      " please install the font in 'Dotfiles\font'
      set guifont=DejaVu_Sans_Mono_for_Powerline:h11:cANSI:qDRAFT
    elseif OSX()
      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
    else
      set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
    endif
  endif

  " indent use backspace delete indent, eol use backspace delete line at
  " begining start delete the char you just typed in if you do not use set
  " nocompatible ,you need this
  set backspace=indent,eol,start

  " Shou number and relativenumber
  set relativenumber
  set number

  " set fillchar
  hi VertSplit ctermbg=NONE guibg=NONE
  set fillchars+=vert:│

  " hide cmd
  set noshowcmd

  " indent
  set autoindent
  set smartindent
  set cindent

  " show wildmenu
  set wildmenu

  " do not break words.
  set linebreak

  " tab options:
  set tabstop=4
  set expandtab
  set softtabstop=4
  set shiftwidth=4

  " autoread
  set autoread

  " backup
  set backup
  set undofile
  set undolevels=1000
  let g:data_dir = $HOME . '/.data/'
  let g:backup_dir = g:data_dir . 'backup'
  let g:swap_dir = g:data_dir . 'swap'
  let g:undo_dir = g:data_dir . 'undofile'
  if finddir(g:data_dir) ==# ''
    silent call mkdir(g:data_dir)
  endif
  if finddir(g:backup_dir) ==# ''
    silent call mkdir(g:backup_dir)
  endif
  if finddir(g:swap_dir) ==# ''
    silent call mkdir(g:swap_dir)
  endif
  if finddir(g:undo_dir) ==# ''
    silent call mkdir(g:undo_dir)
  endif
  unlet g:backup_dir
  unlet g:swap_dir
  unlet g:data_dir
  unlet g:undo_dir
  set undodir=$HOME/.data/undofile
  set backupdir=$HOME/.data/backup
  set directory=$HOME/.data/swap

  " no fold enable
  set nofoldenable
  set nowritebackup
  set matchtime=0
  set ruler
  set showmatch
  set showmode
  "menuone: show the pupmenu when only one match
  " disable preview scratch window,
  set completeopt=menu,menuone,longest
  " h: 'complete'
  set complete=.,w,b,u,t
  " limit completion menu height
  set pumheight=15
  set scrolloff=3
  set incsearch
  set hlsearch
  set laststatus=2
  set wildignorecase
  set mouse=
  set hidden
  set ttimeout
  set ttimeoutlen=50
  set lazyredraw
  if has('patch-7.4.314')
    " don't give ins-completion-menu messages.
    set shortmess+=c
  endif
endfunction

function! Vim#default#SetPlugins() abort


  call add(g:vim_plugin_groups, 'lang')
  call add(g:vim_plugin_groups, 'lang#markdown')
  call add(g:vim_plugin_groups, 'javascript')
  call add(g:vim_plugin_groups, 'python')
  call add(g:vim_plugin_groups, 'scala')
  call add(g:vim_plugin_groups, 'edit')
  call add(g:vim_plugin_groups, 'default')
  call add(g:vim_plugin_groups, 'chat')
  call add(g:vim_plugin_groups, 'core')
  call Vim#layers#load('core#statusline')
  call Vim#layers#load('core#tabline')
  call add(g:vim_plugin_groups, 'autocomplete')
  call add(g:vim_plugin_groups, 'ctrlp')
  call add(g:vim_plugin_groups, 'web')
  call add(g:vim_plugin_groups, 'ui')
  call add(g:vim_plugin_groups, 'tools')
  call add(g:vim_plugin_groups, 'checkers')
  call add(g:vim_plugin_groups, 'format')
  call add(g:vim_plugin_groups, 'git')
  call add(g:vim_plugin_groups, 'scm')
  call add(g:vim_plugin_groups, 'editing')
  call add(g:vim_plugin_groups, 'indents')
  call add(g:vim_plugin_groups, 'navigation')
  call add(g:vim_plugin_groups, 'misc')

  call add(g:vim_plugin_groups, 'unite')
  call add(g:vim_plugin_groups, 'github')
  if has('python3')
    call add(g:vim_plugin_groups, 'denite')
  endif
  call add(g:vim_plugin_groups, 'vim')
  call add(g:vim_plugin_groups, 'linux')
endfunction

function! Vim#default#SetMappings() abort
  "设置<leader>前缀键
  let leader=";"
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

endfunction

" vim:set et sw=2:
