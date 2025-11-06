set = require'set'
set'local' 'shiftwidth' (4)
set'local' 'expandtab' (4)

ftp = require'ftplib'
ftp.fmt_autocmd('cabal-fmt')
