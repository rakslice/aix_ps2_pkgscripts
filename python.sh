#!/bin/sh
set -e
set -x

pkgname=Python-2.7.15
tarball=$pkgname.tgz

make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
#. binutils-2.13.2.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

cp $pkgscripts/codefragments/memmove.h Include/ 
cp $pkgscripts/codefragments/strtoul.c Include/ 

# The previous built version adds a configure param with the PKG_CONFIG_PATH
# PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig

ENV= CONFIG_SHELL=/archive/bash2 SHELL=/archive/bash2 /archive/bash2 ./configure --with-pydebug --disable-shared CC=gcc

CONFIG_SHELL=/archive/bash2 SHELL=/archive/bash2 $make \
	LINKFORSHARED= LDSHARED= BLDSHARED= LDCXXSHARED=

prefixvar=DESTDIR

. $pkgscripts/common-end.inc
