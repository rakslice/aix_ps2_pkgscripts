#!/bin/sh
set -e
set -x

pkgname=zlib-1.2.11
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

. createdirs.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

#/usr/local/bin/patch -p1 -i $patches/$pkgname.patch

$pkgscripts/superconf

$make

prefixvar=DESTDIR

for d in $pkgdir/usr/local/share/man/man3 ; do
	createdirs $d
done

. $pkgscripts/common-end.inc
