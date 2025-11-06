set = require'set'
set'local' 'shiftwidth' (2)
set'local' 'expandtab' (true)

lib = require'lib'
lib.buflocal_autofmt('cabal-fmt')
