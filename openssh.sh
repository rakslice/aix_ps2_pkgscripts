#!/bin/sh
set -e
set -x

pkgname=openssh-2.9p2
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p1 -i $patches/$pkgname.patch

cp -r $pkgscripts/codefragments/md5/* .
cp $pkgscripts/codefragments/stdint.h .

./configure --with-prngd-socket=/usr/local/var/run/egd-pool

$make

prefixvar=DESTDIR

. $pkgscripts/common-end.inc
