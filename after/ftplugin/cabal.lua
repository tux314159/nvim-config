set = require'set'
set'local' 'shiftwidth' (4)
set'local' 'expandtab' (true)

ftp = require'ftplib'
ftp.fmt_autocmd(function() vim.cmd '%!cabal-fmt' end)
