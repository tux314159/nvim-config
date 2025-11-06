set = require'set'
set'local' 'shiftwidth' (4)
set'local' 'expandtab' (true)

lib = require'lib'
lib.buflocal_autofmt('cabal-fmt')
