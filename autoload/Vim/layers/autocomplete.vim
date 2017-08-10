""
" @section autocomplete, autocomplete
" @parentsection layers
" @subsection code completion
" Vim uses neocomplete as the default completion engine if vim has lua
" support. If there is no lua support, neocomplcache will be used for the
" completion engine. Spacevim uses deoplete as the default completion engine
" for neovim. Deoplete requires neovim to be compiled with python support. For
" more information on python support, please read neovim's |provider-python|.
"
" Vim includes YouCompleteMe, but it is disabled by default. To enable
" ycm, see |g:vim_enable_ycm|.
"
" @subsection snippet
" Vim use neosnippet as the default snippet engine. The default snippets
" are provided by `Shougo/neosnippet-snippets`. For more information, please read
" |neosnippet|. Neosnippet support custom snippets, and the default snippets
" directory is `~/.Vim/snippets/`. If `g:vim_force_global_config = 1`,
" Vim will not append `./.Vim/snippets` as default snippets directory.


function! Vim#layers#autocomplete#plugins() abort
  let plugins = [
        \ ['honza/vim-snippets',          { 'on_event' : 'InsertEnter', 'loadconf_before' : 1}],
        \ ['Shougo/neco-syntax',          { 'on_event' : 'InsertEnter'}],
        \ ['ujihisa/neco-look',           { 'on_event' : 'InsertEnter'}],
        \ ['Shougo/context_filetype.vim', { 'on_event' : 'InsertEnter'}],
        \ ['Shougo/neoinclude.vim',       { 'on_event' : 'InsertEnter'}],
        \ ['Shougo/neosnippet-snippets',  { 'merged' : 0}],
        \ ['Shougo/neopairs.vim',         { 'on_event' : 'InsertEnter'}],
        \ ['Raimondi/delimitMate',        { 'merged' : 0}],
        \ ]
  " snippet
  if g:vim_snippet_engine ==# 'neosnippet'
    call add(plugins,  ['Shougo/neosnippet.vim', { 'on_event' : 'InsertEnter',
          \ 'on_ft' : 'neosnippet',
          \ 'loadconf' : 1,
          \ 'on_cmd' : 'NeoSnippetEdit'}])
  elseif g:vim_snippet_engine ==# 'ultisnips'
    call add(plugins, ['SirVer/ultisnips',{ 'loadconf_before' : 1,
          \ 'merged' : 0}])
  endif
  if g:vim_autocomplete_method ==# 'ycm'
    call add(plugins, ['ervandew/supertab',                 { 'loadconf_before' : 1, 'merged' : 0}])
    call add(plugins, ['Valloric/YouCompleteMe',            { 'loadconf_before' : 1, 'merged' : 0}])
  elseif g:vim_autocomplete_method ==# 'neocomplete'
    call add(plugins, ['Shougo/neocomplete', {
          \ 'on_event' : 'InsertEnter',
          \ 'loadconf' : 1,
          \ }])
  elseif g:vim_autocomplete_method ==# 'neocomplcache' "{{{
    call add(plugins, ['Shougo/neocomplcache.vim', {
          \ 'on_event' : 'InsertEnter',
          \ 'loadconf' : 1,
          \ }])
  elseif g:vim_autocomplete_method ==# 'deoplete'
    call add(plugins, ['Shougo/deoplete.nvim', {
          \ 'on_event' : 'InsertEnter',
          \ 'loadconf' : 1,
          \ }])
  endif
  call add(plugins, ['tenfyzhong/CompleteParameter.vim',  {'merged': 0}])
  return plugins
endfunction


function! Vim#layers#autocomplete#config() abort
  let g:delimitMate_matchpairs = '[:],{:},<:>'
  inoremap <silent><expr> ( complete_parameter#pre_complete("()")

  "mapping
  imap <silent><expr><TAB> Vim#mapping#tab()
  imap <silent><expr><S-TAB> Vim#mapping#shift_tab()
  imap <silent><expr><CR> Vim#mapping#enter()
  smap <expr><TAB>
        \ neosnippet#expandable_or_jumpable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" :
        \ (complete_parameter#jumpable(1) ?
        \ "\<plug>(complete_parameter#goto_next_parameter)" :
        \ "\<TAB>")

  inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
  inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
  inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
  " in origin vim or neovim Alt + / will insert a /, this should be disabled.
  imap <expr> <M-/>
        \ neosnippet#expandable() ?
        \ "\<Plug>(neosnippet_expand)" : ""
    call Vim#mapping#space#def('nnoremap', ['i', 's'], 'Unite neosnippet', 'insert sneppets', 1)
endfunction

function! Vim#layers#autocomplete#set_variable(var)

  let s:return_key_behavior = get(a:var,
        \ 'auto-completion-return-key-behavior',
        \ 'nil')
  let s:tab_key_behavior = get(a:var,
        \ 'auto-completion-tab-key-behavior',
        \ 'smart')
  let s:key_sequence = get(a:var,
        \ 'auto-completion-complete-with-key-sequence',
        \ 'nil')
  let s:key_sequence_delay = get(a:var,
        \ 'auto-completion-complete-with-key-sequence-delay',
        \ 0.1)

endfunction


" vim:set et sw=2 cc=80:
