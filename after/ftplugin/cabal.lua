set = require'set'
set'local' 'shiftwidth' (4)
set'local' 'expandtab' (true)

lib = require'lib'
lib.buflocal_autofmt(function() vim.cmd '%!cabal-fmt' end)
