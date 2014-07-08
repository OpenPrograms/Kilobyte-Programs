id :'vortex-runtime'
name 'Vortex Runtime'
description 'Vortex - A functional language that compiles to lua'

install Dir['lib/*.lua'] => '/lib'
install Dir['lib/vortex/*.lua'] => '/lib/vortex'
install Dir['lib/vortex/rt/*.lua'] => '/lib/vortex/rt'
install Dir['lib/vxrt/*.lua'] => '/lib/vxrt'

authors 'Kilobyte'