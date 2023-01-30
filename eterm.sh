#!/bin/sh
set -e
set -x

pkgname=Eterm-0.9.6
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

# also get the bg tarball
$gunzip -c `dirname "$tarballfull"`/Eterm-bg-0.9.6.tar.gz | tar xf -

# workaround for bg install script incorrect use of relative path to install_sh
ln -s ../install-sh bg/install-sh

cp $pkgscripts/codefragments/memmove.h .
cp $pkgscripts/codefragments/alttio.h .

#/usr/local/bin/patch -p1 -i $patches/$pkgname.built.patch
/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

ENV= CONFIG_SHELL=/archive/bash2 SHELL=/archive/bash2 /archive/bash2 ./configure --disable-multi-charset --enable-escreen --enable-auto-encoding --disable-trans --disable-etwin LDFLAGS=-lfreetype

# fix for weird makefile mangling
for f in `find . -name Makefile -print`; do sed -i 's/i clude/include/g' $f; done 

$make 

prefixvar=DESTDIR

leave_source=true

. $pkgscripts/common-end.inc
