id :'vortex-compiler'
name 'Vortex Compiler'
description 'Vortex - A functional language that compiles to lua'

install Dir['bin/*.lua'] => '/bin'
install Dir['lib/vortex/*.lua'] => '/lib/vortex'

authors 'Kilobyte'

depend :'vortex-runtime'