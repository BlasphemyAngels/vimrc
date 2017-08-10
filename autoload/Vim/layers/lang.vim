function! Vim#layers#lang#plugins() abort
    let plugins = [
                \ ['groenewege/vim-less',                    { 'on_ft' : ['less']}],
                \ ['cakebaker/scss-syntax.vim',              { 'on_ft' : ['scss','sass']}],
                \ ['hail2u/vim-css3-syntax',                 { 'on_ft' : ['css','scss','sass']}],
                \ ['ap/vim-css-color',                       { 'on_ft' : ['css','scss','sass','less','styl']}],
                \ ['othree/html5.vim',                       { 'on_ft' : ['html']}],
                \ ['wavded/vim-stylus',                      { 'on_ft' : ['stylus']}],
                \ ['digitaltoad/vim-jade',                   { 'on_ft' : ['jade']}],
                \ ['juvenn/mustache.vim',                    { 'on_ft' : ['mustache']}],
                \ ['leafgarland/typescript-vim',             { 'on_ft' : ['typescript']}],
                \ ['kchmck/vim-coffee-script',               { 'on_ft' : ['coffee']}],
                \ ['leshill/vim-json',                       { 'on_ft' : ['javascript','json']}],
                \ ['PotatoesMaster/i3-vim-syntax',           { 'on_ft' : 'i3'}],
                \ ['lervag/vimtex',                          { 'on_ft' : 'tex'}],
                \ ['vimperator/vimperator.vim',              { 'on_ft' : 'vimperator'}],
                \ ['peterhoeg/vim-qml',                      { 'on_ft' : 'qml'}],
                \ ['cespare/vim-toml',                      { 'on_ft' : 'toml'}],
                \ ] 
    return plugins
endfunction

function! Vim#layers#lang#config() abort
endfunction
