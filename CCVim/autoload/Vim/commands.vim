function! Vim#commands#load() abort
  ""
  " Print the version of Vim.  The following lines contain information
  " about which features were enabled.  When there is a preceding '+', the
  " feature is included, when there is a '-' it is excluded.
  command! -nargs=0 SPCheck call Vim#commands#check()
  ""
  " print the debug information of vim, [!] forces the output into a
  " new buffer.
  command! -nargs=0 -bang SPDebugInfo call Vim#logger#viewLog('<bang>' == '!')
  ""
  " edit custom config file of Vim, by default this command will open
  " global custom configuration file, '-l' option will load local custom
  " configuration file.
  " >
  "   :SPConfig -g
  " <
  command! -nargs=*
        \ -complete=customlist,Vim#commands#complete_SPConfig
        \ SPConfig call Vim#commands#config(<f-args>)
  ""
  " Command for update plugin, support completion of plugin name. If run
  " without argv, All the plugin will be updated.
  " >
  "     :SPUpdate vim-airline
  " <
  command! -nargs=*
        \ -complete=custom,Vim#commands#complete_plugin
        \ SPUpdate call Vim#commands#update_plugin(<f-args>)
  ""
  " Command for install plugins.
  command! -nargs=* SPInstall call Vim#commands#install_plugin(<f-args>)
endfunction

" @vimlint(EVL103, 1, a:ArgLead)
" @vimlint(EVL103, 1, a:CmdLine)
" @vimlint(EVL103, 1, a:CursorPos)
function! Vim#commands#complete_plugin(ArgLead, CmdLine, CursorPos) abort
  return join(keys(dein#get()) + ['Vim'], "\n")
endfunction
" @vimlint(EVL103, 0, a:ArgLead)
" @vimlint(EVL103, 0, a:CmdLine)
" @vimlint(EVL103, 0, a:CursorPos)

" @vimlint(EVL103, 1, a:ArgLead)
" @vimlint(EVL103, 1, a:CmdLine)
" @vimlint(EVL103, 1, a:CursorPos)
function! Vim#commands#complete_SPConfig(ArgLead, CmdLine, CursorPos) abort
  return ['-g', '-l']
endfunction
" @vimlint(EVL103, 0, a:ArgLead)
" @vimlint(EVL103, 0, a:CmdLine)
" @vimlint(EVL103, 0, a:CursorPos)

function! Vim#commands#config(...) abort
  if (a:0 > 0 && a:1 ==# '-g') || a:0 == 0
    tabnew ~/.vim/vimrc
  elseif  a:0 > 0 && a:1 ==# '-l'
    tabnew .vim/vimrc
  endif
endfunction

function! Vim#commands#update_plugin(...) abort
  if g:vim_plugin_manager ==# 'neobundle'
  elseif g:vim_plugin_manager ==# 'dein'
    if a:0 == 0
      call Vim#plugins#manager#update()
    else
      call Vim#plugins#manager#update(a:000)
    endif
  elseif g:vim_plugin_manager ==# 'vim-plug'
  endif
endfunction

function! Vim#commands#install_plugin(...) abort
  if g:vim_plugin_manager ==# 'neobundle'
  elseif g:vim_plugin_manager ==# 'dein'
    if a:0 == 0
      call Vim#plugins#manager#install()
    else
      call dein#install(a:000)
    endif
  elseif g:vim_plugin_manager ==# 'vim-plug'
  endif
endfunction

function! Vim#commands#check() abort
  echo 'Vim ' . '-' . s:SHA() . "\n" .
        \ "\n" .
        \ 'Optional features included (+) or not (-):' . "\n"
        \ s:check_features([
        \ 'tui',
        \ 'jemalloc',
        \ 'acl',
        \ 'arabic',
        \ 'autocmd',
        \ 'browse',
        \ 'byte_offset',
        \ 'cindent',
        \ 'clientserver',
        \ 'clipboard',
        \ 'cmdline_compl',
        \ 'cmdline_hist',
        \ 'cmdline_info',
        \ 'comments',
        \ 'conceal',
        \ 'cscope',
        \ 'cursorbind',
        \ 'cursorshape',
        \ 'debug',
        \ 'dialog_gui',
        \ 'dialog_con',
        \ 'dialog_con_gui',
        \ 'digraphs',
        \ 'eval',
        \ 'ex_extra',
        \ 'extra_search',
        \ 'farsi',
        \ 'file_in_path',
        \ 'find_in_path',
        \ 'folding',
        \ 'gettext',
        \ 'iconv',
        \ 'iconv/dyn',
        \ 'insert_expand',
        \ 'jumplist',
        \ 'keymap',
        \ 'langmap',
        \ 'libcall',
        \ 'linebreak',
        \ 'lispindent',
        \ 'listcmds',
        \ 'localmap',
        \ 'menu',
        \ 'mksession',
        \ 'modify_fname',
        \ 'mouse',
        \ 'mouseshape',
        \ 'multi_byte',
        \ 'multi_byte_ime',
        \ 'multi_lang',
        \ 'path_extra',
        \ 'persistent_undo',
        \ 'postscript',
        \ 'printer',
        \ 'profile',
        \ 'python',
        \ 'python3',
        \ 'quickfix',
        \ 'reltime',
        \ 'rightleft',
        \ 'scrollbind',
        \ 'shada',
        \ 'signs',
        \ 'smartindent',
        \ 'startuptime',
        \ 'statusline',
        \ 'syntax',
        \ 'tablineat',
        \ 'tag_binary',
        \ 'tag_old_static',
        \ 'tag_any_white',
        \ 'termguicolors',
        \ 'terminfo',
        \ 'termresponse',
        \ 'textobjects',
        \ 'tgetent',
        \ 'timers',
        \ 'title',
        \ 'toolbar',
        \ 'user_commands',
        \ 'vertsplit',
        \ 'virtualedit',
        \ 'visual',
        \ 'visualextra',
        \ 'vreplace',
        \ 'wildignore',
        \ 'wildmenu',
        \ 'windows',
        \ 'writebackup',
        \ 'xim',
        \ 'xfontset',
        \ 'xpm',
        \ 'xpm_w32',
        \ ])
endfunction

function! s:check_features(features) abort
  let flist = map(a:features, "(has(v:val) ? '+' : '-') . v:val")
  let rst = '    '
  let id = 1
  for f in flist
    let rst .= f . repeat(' ', 20 - len(f))
    if id == 3
      let rst .= "\n    "
      let id = 1
    else
      let id += 1
    endif
  endfor
  return substitute(rst, '\n*\s*$', '', 'g')
endfunction

function! s:SHA() abort
  return system('git --no-pager -C ~/.Vim  log -n 1 --oneline')[:7]
endfunction


" vim:set et sw=2 cc=80:
