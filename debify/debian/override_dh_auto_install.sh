#!/bin/bash

source debian/vars.sh

set -x 

mkdir -p debian/tmp/etc/apache2/conf.d
mkdir -p debian/tmp/usr/lib64/apache2/modules

cp mod_wsgi.conf debian/tmp/etc/apache2/conf.d
cp src/server/.libs/mod_wsgi.so debian/tmp/usr/lib64/apache2/modules

echo "FILELIST"
find . -type f -print | sort

