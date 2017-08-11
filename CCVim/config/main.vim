let g:Config_Main_Home = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.((has('win16') || has('win32') || has('win64'))?'\':'/') . '?')


" [dir?, path]
function! s:parser_argv() abort
    if !argc()
        return [1, getcwd()]
    elseif argv(0) =~# '/$'
        let f = expand(argv(0))
        if isdirectory(f)
            return [1, f]
        else
            return [1, getcwd()]
        endif
    elseif argv(0) ==# '.'
        return [1, getcwd()]
    elseif isdirectory(expand(argv(0)))
        return [1, expand(argv(0)) ]
    else
        return [0]
    endif
endfunction
let s:status = s:parser_argv()
if s:status[0]
    let g:_vim_enter_dir = s:status[1]
    augroup SPwelcome
        au!
        autocmd VimEnter * call Vim#welcome()
    augroup END
endif

call zvim#util#source_rc('basic_setting.vim')

try
    call zvim#util#source_rc('functions.vim')
catch
    execute 'set rtp +=' . fnamemodify(g:Config_Main_Home, ':p:h:h')
    call zvim#util#source_rc('functions.vim')
endtry


call zvim#util#source_rc('init.vim')

call Vim#default()

call Vim#loadCustomConfig()

call Vim#end()

call zvim#util#source_rc('general.vim')



call Vim#autocmds#init()

call zvim#util#source_rc('commands.vim')
filetype plugin indent on
syntax on
