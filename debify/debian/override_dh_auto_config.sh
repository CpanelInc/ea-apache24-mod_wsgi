#!/bin/bash

source debian/vars.sh

set -x

cat <<EOF > mod_wsgi.conf
### Load the module
LoadModule wsgi_module modules/mod_wsgi.so
EOF

# pulled from apr-util
mkdir -p config
cp $ea_apr_config config/apr-1-config
cp $ea_apr_config config/apr-config
cp /usr/share/pkgconfig/ea-apr16-1.pc config/apr-1.pc
cp /usr/share/pkgconfig/ea-apr16-util-1.pc config/apr-util-1.pc
cp /usr/share/pkgconfig/ea-apr16-1.pc config
cp /usr/share/pkgconfig/ea-apr16-util-1.pc config

export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:`pwd`/config"
touch configure

export CFLAGS="$CFLAGS -I/usr/include/python2.7"
./configure --with-python=/usr/bin/python2

make 
