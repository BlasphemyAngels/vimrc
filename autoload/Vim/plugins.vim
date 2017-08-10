scriptencoding utf-8
function! Vim#plugins#load() abort
  if zvim#plug#enable_plug()
    call zvim#plug#begin(g:vim_plugin_bundle_dir)
    call zvim#plug#fetch()
    call s:load_plugins()
    call s:disable_plugins(g:vim_disabled_plugins)
    call zvim#plug#end()
  endif

endfunction
function! s:load_plugins() abort
  for group in g:vim_plugin_groups
    let g:_vim_plugin_layer = group
    for plugin in s:getLayerPlugins(group)
      if len(plugin) == 2
        call zvim#plug#add(plugin[0], plugin[1])
        if zvim#plug#tap(split(plugin[0], '/')[-1]) && get(plugin[1], 'loadconf', 0 )
          call zvim#plug#defind_hooks(split(plugin[0], '/')[-1])
        endif
        if zvim#plug#tap(split(plugin[0], '/')[-1]) && get(plugin[1], 'loadconf_before', 0 )
          call zvim#plug#loadPluginBefore(split(plugin[0], '/')[-1])
        endif
      else
        call zvim#plug#add(plugin[0])
      endif
    endfor
    call s:loadLayerConfig(group)
  endfor
  unlet g:_vim_plugin_layer
  for plugin in g:vim_custom_plugins
    if len(plugin) == 2
      call zvim#plug#add(plugin[0], plugin[1])
    else
      call zvim#plug#add(plugin[0])
    endif
  endfor
endfunction

function! s:getLayerPlugins(layer) abort
  let p = []
  try
    let p = Vim#layers#{a:layer}#plugins()
  catch /^Vim\%((\a\+)\)\=:E117/
  endtry
  return p
endfunction

function! s:loadLayerConfig(layer) abort
  try
    call Vim#layers#{a:layer}#config()
  catch /^Vim\%((\a\+)\)\=:E117/
  endtry

endfunction

function! s:disable_plugins(plugin_list) abort
  for name in a:plugin_list
    call dein#disable(name)
  endfor
endfunction

function! Vim#plugins#get(...) abort

endfunction

" vim:set et sw=2:
