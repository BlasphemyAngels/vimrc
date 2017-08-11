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
  "mapping
  imap <silent><expr><TAB> Vim#mapping#tab#i_tab()
  imap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
  imap <silent><expr><S-TAB> Vim#mapping#shift_tab()
  smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  imap <silent><expr><CR> Vim#mapping#enter#i_enter()
  inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
  inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
  inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
  smap <expr><S-TAB> pumvisible() ? "\<C-p>" : ""
  " Save a file with sudo
  " http://forrst.com/posts/Use_w_to_sudo_write_a_file_with_Vim-uAN
  cnoremap w!! %!sudo tee > /dev/null %


  " Use Ctrl+* to jump between windows
  nnoremap <silent><C-Right> :<C-u>wincmd l<CR>
  nnoremap <silent><C-Left>  :<C-u>wincmd h<CR>
  nnoremap <silent><C-Up>    :<C-u>wincmd k<CR>
  nnoremap <silent><C-Down>  :<C-u>wincmd j<CR>
  if has('nvim')
    exe 'tnoremap <silent><C-Right> <C-\><C-n>:<C-u>wincmd l<CR>'
    exe 'tnoremap <silent><C-Left>  <C-\><C-n>:<C-u>wincmd h<CR>'
    exe 'tnoremap <silent><C-Up>    <C-\><C-n>:<C-u>wincmd k<CR>'
    exe 'tnoremap <silent><C-Down>  <C-\><C-n>:<C-u>wincmd j<CR>'
    exe 'tnoremap <silent><M-Left>  <C-\><C-n>:<C-u>bprev<CR>'
    exe 'tnoremap <silent><M-Right>  <C-\><C-n>:<C-u>bnext<CR>'
    exe 'tnoremap <silent><esc>     <C-\><C-n>'
  endif


  "Use jk switch to normal mode
  inoremap jk <esc>

  "]<End> or ]<Home> move current line to the end or the begin of current buffer
  nnoremap <silent>]<End> ddGp``
  nnoremap <silent>]<Home> ddggP``
  vnoremap <silent>]<End> dGp``
  vnoremap <silent>]<Home> dggP``


  "Ctrl+Shift+Up/Down to move up and down
  nnoremap <silent><C-S-Down> :m .+1<CR>==
  nnoremap <silent><C-S-Up> :m .-2<CR>==
  inoremap <silent><C-S-Down> <Esc>:m .+1<CR>==gi
  inoremap <silent><C-S-Up> <Esc>:m .-2<CR>==gi
  vnoremap <silent><C-S-Down> :m '>+1<CR>gv=gv
  vnoremap <silent><C-S-Up> :m '<-2<CR>gv=gv
  " download gvimfullscreen.dll from github, copy gvimfullscreen.dll to

  nnoremap <Up> <nop>
  nnoremap <Down> <nop>
  nnoremap <Left> <nop>
  nnoremap <Right> <nop>
  inoremap <Up> <nop>
  inoremap <Down> <nop>
  inoremap <Left> <nop>
  inoremap <Right> <nop>
  nnoremap & i&ensp;&ensp;&ensp;<Esc>

endfunction

" vim:set et sw=2:
