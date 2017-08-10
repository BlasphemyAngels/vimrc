scriptencoding utf-8
fu! Generate_ignore(ignore,tool, ...) abort
    let ignore = []
    if a:tool ==# 'ag'
        for ig in split(a:ignore,',')
            call add(ignore, '--ignore')
            call add(ignore, ig )
        endfor
    elseif a:tool ==# 'rg'
        for ig in split(a:ignore,',')
            call add(ignore, '-g')
            if a:0 > 0
                call add(ignore, "'!" . ig . "'")
            else
                call add(ignore, '!' . ig)
            endif
        endfor
    endif
    return ignore
endf
