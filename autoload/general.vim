scriptencoding utf-8
exe 'set wildignore+=' . g:vim_wildignore
" shell
if has('filterpipe')
    set noshelltemp
endif
if g:vim_enable_guicolors == 1
    if !has('nvim') && has('patch-7.4.1770')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    if exists('+termguicolors')
        set termguicolors
    elseif exists('+guicolors')
        set guicolors
    endif
endif
if count(g:vim_plugin_groups, 'colorscheme') && g:vim_colorscheme !=# '' "{{{
    try
        exec 'set background=' . g:vim_colorscheme_bg
        exec 'colorscheme ' . g:vim_colorscheme
    catch
        exec 'colorscheme '. g:vim_colorscheme_default
    endtry
else
    exec 'colorscheme '. g:vim_colorscheme_default
endif
if g:vim_hiddenfileinfo == 1 && has('patch-7.4.1570')
    set shortmess+=F
endif
if !empty(g:vim_guifont)
    exe 'set guifont=' . g:vim_guifont
endif
