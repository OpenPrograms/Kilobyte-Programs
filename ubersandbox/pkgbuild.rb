id :ubersandbox
name 'UberSanbox'
description 'A sandbox to run scripts in'

install Dir['bin/*.lua'] => '/bin'
install Dir['lib/*.lua'] => '/lib'
install Dir['lib/ubersandbox/*.lua'] => '/lib/ubersandbox'

authors 'Kilobyte'

depend :'oop-system' => '/'
depend configparser: '/'
depend deepcopy: '/'