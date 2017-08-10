function! Vim#layers#lang#sh#config()
    call Vim#layers#edit#add_ft_head_tamplate('sh',
                \ ['#!/usr/bin/env bash',
                \ '']
                \ )
endfunction
