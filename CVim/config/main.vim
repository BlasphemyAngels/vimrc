scriptencoding utf-8
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle    
" required!     
Bundle 'gmarik/vundle'    
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'ianva/vim-youdao-translater'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'dyng/ctrlsf.vim'
Plugin 'ervandew/supertab'
Plugin 'mileszs/ack.vim'
Plugin 'ggreer/the_silver_searcher'
Plugin 'VundleVim/Vundle.vim'
Plugin 'mhinz/vim-startify'
Plugin 'tell-k/vim-autopep8'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
"Plugin 'scrooloose/syntastic'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-fugitive'
Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'xptemplate'
"Plugin 'rkulla/pydiction'
Plugin 'Color-Scheme-Explorer'
Plugin 'flazz/vim-colorschemes'
Plugin 'fholgado/minibufexpl.vim'
"""侦测文件类型"""
filetype on
"""为特定文件类型载入相关缩进文件"""
filetype plugin indent on    
"""载入文件类型插件"""
filetype plugin on

source "plugins/setting.vim"
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --nogroup --nocolor --column'
