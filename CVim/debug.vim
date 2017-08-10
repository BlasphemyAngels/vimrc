scriptencoding utf-8
"python debug
python << EOF
import time
import vim
def SetBreakpoint():
    nLine = int( vim.eval( 'line(".")'))
    strLine = vim.current.line
    i = 0
    strWhite = ""
    while strLine[i] == ' ' or strLine[i] == "\t":
        i += 1
        strWhite += strLine[i]
    vim.current.buffer.append(
       "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)
    for strLine in vim.current.buffer:
        if strLine == "import pdb":
            break
        else:
            vim.current.buffer.append( 'import pdb', 4)
            vim.command( 'normal j1')
            break
vim.command( 'map <leader>b :py SetBreakpoint()<cr>')

def RemoveBreakpoints():
    nCurrentLine = int( vim.eval( 'line(".")'))
    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == 'import pdb' or strLine.lstrip()[:15] == 'pdb.set_trace()':
            nLines.append( nLine)
        nLine += 1
    nLines.reverse()
    for nLine in nLines:
        vim.command( 'normal %dG' % nLine)
        vim.command( 'normal dd')
        if nLine < nCurrentLine:
            nCurrentLine -= 1
    vim.command( 'normal %dG' % nCurrentLine)
vim.command( 'map <leader>c :py RemoveBreakpoints()<cr>')
vim.command( 'map <leader>p :!python %<cr>')
EOF
