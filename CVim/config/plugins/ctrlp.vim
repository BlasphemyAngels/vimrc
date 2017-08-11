scriptencoding utf-8

"默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
let g:ctrlp_by_filename = 0
"自定义搜索列表的提示符
let g:ctrlp_line_prefix = '♪'
"默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
let g:ctrlp_regexp = 0
"<leader>p搜索当前目录下文件
"let g:ctrlp_map = '<leader>p'
"<leader>f搜索MRU（Most Recently Used）文件
nmap <leader>f :CtrlPMRUFiles<CR>
"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0
"设置MRU最大条目数为500
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1
nnoremap <C-n> :CtrlPFunky<Cr>
nnoremap <Leader>fu :CtrlPFunky<Cr>
"<leader>b显示缓冲区文件，并可通过序号进行跳转
nmap <Leader>cb :CtrlPBuffer<CR>



let g:ctrlp_map = get(g:,'ctrlp_map', '<c-p>')
let g:ctrlp_cmd = get(g:, 'ctrlp_cmd', 'CtrlP')
let g:ctrlp_working_path_mode = get(g:, 'ctrlp_working_path_mode', 'ra')
let g:ctrlp_root_markers = get(g:, 'ctrlp_root_markers', 'pom.xml')
let g:ctrlp_match_window = get(g:, 'ctrlp_match_window', 'bottom,order:btt,min:1,max:15,results:15')
let g:ctrlp_show_hidden = get(g:, 'ctrlp_show_hidden', 1)
"for caching
let g:ctrlp_use_caching = get(g:, 'ctrlp_use_caching', 500)
let g:ctrlp_clear_cache_on_exit = get(g:, 'ctrlp_clear_cache_on_exit', 1)
let g:ctrlp_cache_dir = get(g:, 'ctrlp_cache_dir', $HOME.'/.cache/ctrlp')
"let g:ctrlp_map = ',,'
"let g:ctrlp_open_multiple_files = 'v'
"if you have install ag, the g:ctrlp_custom_ignore will not work
let g:ctrlp_custom_ignore = get(g:, 'ctrlp_custom_ignore', {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$|target|node_modules|te?mp$|logs?$|public$|dist$',
      \ 'file': '\v\.(exe|so|dll|ttf|png|gif|jpe?g|bpm)$|\-rplugin\~',
      \ 'link': 'some_bad_symbolic_links',
      \ })
if executable('rg') && !exists('g:ctrlp_user_command')
  let g:ctrlp_user_command = 'rg %s --no-ignore --hidden --files -g "" '
        \ . join(Generate_ignore(g:vim_wildignore,'rg', 1))
elseif executable('ag') && !exists('g:ctrlp_user_command')
  let g:ctrlp_user_command = 'ag %s --hidden -i  -g "" ' . join(Generate_ignore(g:vim_wildignore,'ag'))
endif
if !exists('g:ctrlp_match_func') && (has('python') || has('python3'))
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch'  }
endif
"nnoremap <Leader>kk :CtrlPMixed<Cr>
" comment for ctrlp-funky {{{
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = get(g:, 'ctrlp_funky_syntax_highlight', 1)
" }}}
"for ctrlp_nerdtree {{{
let g:ctrlp_nerdtree_show_hidden = get(g:, 'ctrlp_nerdtree_show_hidden', 1)
"}}}
"for ctrlp_sessions{{{
let g:ctrlp_extensions = ['funky', 'sessions' , 'k' , 'tag', 'mixed', 'quickfix', 'undo', 'line', 'changes', 'cmdline', 'menu']
"}}}
"for k.vim {{{
nnoremap <silent> <leader>qe :CtrlPK<CR>
"}}}
" for ctrlp-launcher {{{
nnoremap <Leader>pl :<c-u>CtrlPLauncher<cr>
"}}}
""for ctrlp-cmatcher {{{
"let g:ctrlp_max_files = 0
"let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
""}}}

augroup Fix_command_in_help_buffer
  au!
  autocmd FileType help exec 'nnoremap <buffer><silent><c-p> :<c-u>CtrlP ' . getcwd() .'<cr>'
  au FileType help exec "nnoremap <silent><buffer> q :q<CR>"
augroup END

