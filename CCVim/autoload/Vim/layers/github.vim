function! Vim#layers#github#plugins() abort
    return [
                \ ['junegunn/vim-github-dashboard',      { 'on_cmd':['GHD','GHA','GHActivity','GHDashboard']}],
                \ ['jaxbot/github-issues.vim',               { 'on_cmd' : 'Gissues'}],
                \ ['wsdjeg/GitHub-api.vim'],
                \ ]
endfunction

function! Vim#layers#github#config() abort
    
endfunction
