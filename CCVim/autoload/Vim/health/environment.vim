function! Vim#health#environment#check() abort
  let result = ['Vim environment check report:']
  call add(result, 'Current progpath: ' . v:progname . '(' . v:progpath . ')')
  call add(result, 'version: ' . v:version)
  call add(result, 'OS: ' . Vim#api#import('system').name())
  call add(result, '[shell, shellcmdflag, shellslash]: ' . string([&shell, &shellcmdflag, &shellslash]))
  return result
endfunction

" vim:set et sw=2:
