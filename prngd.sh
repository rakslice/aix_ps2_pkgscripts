#!/bin/sh
set -e
set -x

pkgname=prngd-0.9.29
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p1 -i $patches/$pkgname.patch

$make CC=gcc CFLAGS="-O2 -Wall -DFREEBSD" \
	DEFS="-DRANDSAVENAME=\\\"/usr/local/etc/prngd/prngd-seed\\\" -DCONFIGFILE=\\\"/usr/local/etc/prngd/prngd.conf\\\" "

# manual install
mkdir $pkgdir/
mkdir $pkgdir/bin
mkdir $pkgdir/sbin
mkdir $pkgdir/etc
mkdir $pkgdir/etc/prngd
mkdir $pkgdir/var
mkdir $pkgdir/var/run

cp prngd $pkgdir/sbin/
cp $pkgscripts/startprngd $pkgdir/bin/
cp $pkgscripts/prngd.conf $pkgdir/etc/prngd/

make=true # no-op make install
. $pkgscripts/common-end.inc
