scriptencoding utf-8
let g:ctrlsf_auto_close = 0
let g:ctrlsf_case_sensitive = 'no'
let g:ctrlsf_context = '-B 5 -A 3'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_extra_backend_args = {
    \ 'pt': '--home-ptignore'
    \ }
let g:ctrlsf_mapping = {
    \ "next": "n",
    \ "prev": "N",
    \ }
let g:ctrlsf_populate_qflist = 1
let g:ctrlsf_regex_pattern = 1
let g:ctrlsf_winsize = '30%'
nmap <leader>sf <Plug>CtrlSFPrompt
vmap <leader>sf <Plug>CtrlSFVwordPath
vmap <leader>sF <Plug>CtrlSFVwordExec
nmap <leader>sp <Plug>CtrlSFPwordPath
nnoremap <leader>so :CtrlSFOpen<CR>
nnoremap <leader>st :CtrlSFToggle<CR>
inoremap <leader>st <Esc>:CtrlSFToggle<CR>
nmap <silent><leader>sn <Plug>CtrlSFCwordExec
