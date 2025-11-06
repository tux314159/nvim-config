set = require'set'
set'local' 'shiftwidth' (4)
set'local' 'expandtab' (true)

lib = require'lib'
lib.fmt_autocmd(function() vim.cmd '%!cabal-fmt' end)
