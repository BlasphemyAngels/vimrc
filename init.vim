let g:spacevim_realtime_leader_guide = 1
call SpaceVim#layers#load('kerskonControl')
call SpaceVim#layers#load('autocomplete')
call SpaceVim#layers#load('cscope')
" call SpaceVim#layers#load('leaderf')
" call SpaceVim#layers#load('unite')
call SpaceVim#layers#load('fzf')
call SpaceVim#layers#load('debug')
call SpaceVim#layers#load('git')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#tmux')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('shell')   
call SpaceVim#layers#load('lang#markdown')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('default')
call SpaceVim#layers#load('github')
call SpaceVim#layers#load('incsearch')
call SpaceVim#layers#load('lang#c')
call SpaceVim#layers#load('checkers')
call SpaceVim#layers#load('lang#java')
call SpaceVim#layers#load('lang#javascript')
" call SpaceVim#layers#load('chat')
" call SpaceVim#layers#load('chinese')
" call SpaceVim#layers#load('colorscheme')
" call SpaceVim#layers#load('lang#elixir')
" call SpaceVim#layers#load('lang#go')
" call SpaceVim#layers#load('lang#haskell')
" call SpaceVim#layers#load('lang#lua')
" call SpaceVim#layers#load('lang#perl')
" call SpaceVim#layers#load('lang#php')
" call SpaceVim#layers#load('denite')
" call SpaceVim#layers#load('lang#rust')
" call SpaceVim#layers#load('lang#swig')
" call SpaceVim#layers#load('lang#xml')
" call SpaceVim#layers#load('tools#screensaver')
" call SpaceVim#layers#load('lang#csharp')
" call SpaceVim#layers#load('lang#dart')
" call SpaceVim#layers#load('lang#elixir')
" call SpaceVim#layers#load('lang#haskell')
" call SpaceVim#layers#load('lang#html')
" call SpaceVim#layers#load('lang#javascript')
" call SpaceVim#layers#load('lang#lisp')
" call SpaceVim#layers#load('lang#ocaml')
" call SpaceVim#layers#load('lang#php')
" call SpaceVim#layers#load('lang#python')
" call SpaceVim#layers#load('lang#ruby')
" call SpaceVim#layers#load('lang#typescript')
" call SpaceVim#layers#load('language-server-protocol')

let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1
let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_statusline_display_mode = 0
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:neomake_vim_enabled_makers = []
let mapleader = ';'
if executable('vimlint')
    call add(g:neomake_vim_enabled_makers, 'vimlint') 
endif
if executable('vint')
    call add(g:neomake_vim_enabled_makers, 'vint') 
endif
if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec<CR>
endif
let g:clang2_placeholder_next = ''
let g:clang2_placeholder_prev = ''
let g:spacevim_custom_plugins = [
    \ ['ryanoasis/vim-devicons'],
    \ ['rizzatti/dash.vim'],
    \ ['vim-scripts/OmniCppComplete'],
    \ ['tmhedberg/SimpylFold'],
    \ ['benmills/vimux'],
    \ ]
let g:spacevim_disabled_plugins = [
    \ ['lyuts/vim-rtags'],
    \ ]

set shiftwidth=4
set encoding=utf8
let s:NUM = SpaceVim#api#import('data#number')

let welcome_banners = [
        \ [
        \ "                           .::::.                                      ",
        \ "                         .::::::::.                                    ",
        \ "                        :::::::::::                                    ",
        \ "                     ..:::::::::::'                                    ",
        \ "                  '::::::::::::'                                       ",
        \ "                    .::::::::::                                        ",
        \ "               '::::::::::::::..                                       ",
        \ "                    ..::::::::::::.                                    ",
        \ "                  ``::::::::::::::::                                   ",
        \ "                   ::::``:::::::::'        .:::.                       ",
        \ "                  ::::'   ':::::'       .::::::::.                     ",
        \ "                .::::'      ::::     .:::::::'::::.                    ",
        \ "               .:::'       :::::  .:::::::::' ':::::.                  ",
        \ "              .::'        :::::.:::::::::'      ':::::.                ",
        \ "             .::'         ::::::::::::::'         ``::::.              ",
        \ "         ...:::           ::::::::::::'              ``::.             ",
        \ "        ```` ':.          ':::::::::'                  ::::..          ",
        \ "                           '.:::::'                    ':'````..       ",
        \],
        \[
        \ '                             _ooOoo_                             ',
        \ '                            o8888888o                                                           ',
        \ '                            88" . "88                   佛曰:                                   ',
        \ '                            (| -_- |)                        写字楼里写字间，写字间里程序员；   ',
        \ '                            O\  =  /O                            ',
        \ '                         ____/`---"\____                     程序人员写程序，又拿程序换酒钱。   ',
        \ '                       ."  \\|     |//  `.                       ',
        \ '                      /  \\|||  :  |||//  \                  酒醒只在网上坐，酒醉还来网下眠；   ',
        \ '                     /  _||||| -:- |||||-  \                     ',
        \ '                     |   | \\\  -  /// |   |                 酒醉酒醒日复日，网上网下年复年。   ',
        \ '                     | \_|  ''\---/''  |   |                     ',
        \ '                     \  .-\__  `-`  ___/-. /                 但愿老死电脑间，不愿鞠躬老板前；   ',
        \ '                   ___`. ."  /--.--\  `. . __                    ',
        \ '                ."" "<  `.___\_<|>_/___."  >""".             奔驰宝马贵者趣，公交自行程序员。   ',
        \ '               | | :  `- \`.;`\ _ /`;.`/ - ` : | |               ',
        \ '               \  \ `-.   \_ __\ /__ _/   .-` /  /           别人笑我忒疯癫，我笑自己命太贱；   ',
        \ '          ======`-.____`-.___\_____/___.-`____.-"======          ',
        \ '                             `=---="                         不见满街漂亮妹，哪个归得程序员？   ',
        \ '         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^           ',
        \ '                       Buddha Bless, No Bug !                    ',
        \],
        \[
        \ '',
        \ '',
        \ '                                         江城子 . 程序员之歌',
        \ '',
        \ '                                   十年生死两茫茫，写程序，到天亮。',
        \ '',
        \ '                                         千行代码，Bug何处藏。',
        \ '',
        \ '                                   纵使上线又怎样，朝令改，夕断肠。',
        \ '',
        \ '',
        \ '                                   领导每天新想法，天天改，日日忙。',
        \ '',
        \ '                                         相顾无言，惟有泪千行。',
        \ '',
        \ '                                   每晚灯火阑珊处，夜难寐，加班狂。',
        \],
        \[
        \ "                              .--,       .--,                                           ",
        \ "                             ( (  \\.---./  ) )                                          ",
        \ "                              '.__/o   o\\__.'                                           ",
        \ "                                 {=  ^  =}                                              ",
        \ "                                  >  -  <                                               ",
        \ "                                 /       \\                                              ",
        \ "                                //       \\\\                                             ",
        \ "                               //|   .   |\\\\                                            ",
        \ "                               ''\\       /''_.-~^`'-.                                   ",
        \ "                                  \\  _  /--'         `                                  ",
        \ "                                ___)( )(___                                             ",
        \ "                               (((__) (__)))    高山仰止,景行行止.虽不能至,心向往之。   ",
        \ ],
        \[
        \ '     ┌───┐   ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┬───┐ ┌───┬───┬───┐                   ',
        \ '     │Esc│   │ F1│ F2│ F3│ F4│ │ F5│ F6│ F7│ F8│ │ F9│F10│F11│F12│ │P/S│S L│P/B│  ┌┐    ┌┐    ┌┐   ',
        \ '     └───┘   └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┴───┘ └───┴───┴───┘  └┘    └┘    └┘   ',
        \ '     ┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───────┐ ┌───┬───┬───┐ ┌───┬───┬───┬───┐ ',
        \ '     │~ `│! 1│@ 2│# 3│$ 4│% 5│^ 6│& 7│* 8│( 9│) 0│_ -│+ =│ BacSp │ │Ins│Hom│PUp│ │N L│ / │ * │ - │ ',
        \ '     ├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─────┤ ├───┼───┼───┤ ├───┼───┼───┼───┤ ',
        \ '     │ Tab │ Q │ W │ E │ R │ T │ Y │ U │ I │ O │ P │{ [│} ]│ | \ │ │Del│End│PDn│ │ 7 │ 8 │ 9 │   │ ',
        \ '     ├─────┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴┬──┴─────┤ └───┴───┴───┘ ├───┼───┼───┤ + │ ',
        \ '     │ Caps │ A │ S │ D │ F │ G │ H │ J │ K │ L │: ;│" ''│ Enter  │               │ 4 │ 5 │ 6 │   │ ',
        \ '     ├──────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────────┤     ┌───┐     ├───┼───┼───┼───┤ ',
        \ '     │ Shift  │ Z │ X │ C │ V │ B │ N │ M │< ,│> .│? /│  Shift   │     │ ↑ │     │ 1 │ 2 │ 3 │   │ ',
        \ '     ├─────┬──┴─┬─┴──┬┴───┴───┴───┴───┴───┴──┬┴───┼───┴┬────┬────┤ ┌───┼───┼───┐ ├───┴───┼───┤ E││ ',
        \ '     │ Ctrl│    │Alt │         Space         │ Alt│    │    │Ctrl│ │ ← │ ↓ │ → │ │   0   │ . │←─┘│ ',
        \ '     └─────┴────┴────┴───────────────────────┴────┴────┴────┴────┘ └───┴───┴───┘ └───────┴───┴───┘ ',
        \ '',
        \],
        \[
        \'                     **************************************************************',
        \'                     *                                                            *',
        \'                     *   .=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-.       *',
        \'                     *    |                     ______                     |      *',
        \'                     *    |                  .-"      "-.                  |      *',
        \'                     *    |                 /            \                 |      *',
        \'                     *    |     _          |              |          _     |      *',
        \'                     *    |    ( \         |,  .-.  .-.  ,|         / )    |      *',
        \'                     *    |     > "=._     | )(__/  \__)( |     _.=" <     |      *',
        \'                     *    |    (_/"=._"=._ |/     /\     \| _.="_.="\_)    |      *',
        \'                     *    |           "=._"(_     ^^     _)"_.="           |      *',
        \'                     *    |               "=\__|IIIIII|__/="               |      *',
        \'                     *    |              _.="| \IIIIII/ |"=._              |      *',
        \'                     *    |    _     _.="_.="\          /"=._"=._     _    |      *',
        \'                     *    |   ( \_.="_.="     `--------`     "=._"=._/ )   |      *',
        \'                     *    |    > _.="                            "=._ <    |      *',
        \'                     *    |   (_/                                    \_)   |      *',
        \'                     *    |                                                |      *',
        \'                     *    ''-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=''    *',
        \'                     *                                                            *',
        \'                     *           LASCIATE OGNI SPERANZA, VOI CH''ENTRATE          *',
        \'                     **************************************************************',
        \],
        \[
        \'                                 出生',
        \'                                  ||',
        \'                                  ||',
        \'                                 \  /',
        \'                                  \/',
        \'                                 青年',
        \'                            （年龄 = rand(20,25))）    《==============',
        \'                                  ||                                 ||',
        \'                                  ||                                 ||',
        \'                                  ||          祝福所有开发工作者     ||',
        \'                                  ||             永远年轻            ||',
        \'                                  ||                                 ||',
        \'                                 \  /                                ||',
        \'                                  \/                                 ||',
        \'                            （20 <= 年龄 <= 25）        ===============',
        \'                                  ||',
        \'                                  ||',
        \'                                 \  /',
        \'                                  \/',
        \'                                等死状态',
        \]
        \]

let g:startify_custom_header = welcome_banners[s:NUM.random(0, len(welcome_banners))]

nnoremap <leader>ev :vsplit ~/.SpaceVim.d/init.vim<cr>
nnoremap <leader>sr :source ~/.SpaceVim.d/init.vim<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel

" 关闭NERDTree快捷键
map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
" let NERDTreeWinSize=31
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" let g:spacevim_enable_ycm = 1
" let g:ycm_python_binary_path = '/usr/bin/python3'
set tags+=~/.vim/tags/opencv

inoremap <Backspace> <nop>
" vnoremap <leader>g" '<li"<Esc>'>a"<Esc>

nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
 " Run the current file with rspec
 map <Leader>rb :call VimuxRunCommand("clear;" . bufname("%"))<CR>
 " Run command without sending a return
 map <Leader>rq :call VimuxRunCommand("clear;", 0)<CR>
set foldmethod=indent
set foldlevel=99
let g:SimpylFold_docstring_preview = 1
