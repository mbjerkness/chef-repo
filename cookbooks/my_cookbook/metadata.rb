name             'my_cookbook'
maintainer       'BjerkNet'
maintainer_email 'mike@bjerkness.com'
license          'Apache 2.0'
description      'Installs/Configures my_cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'chef-client'
depends 'build-essential'
depends 'apt'
depends 'ntp'
depends 'nginx'