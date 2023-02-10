#!/bin/sh
set -e
set -x

pkgname=vim-8.1.0037
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

cp $pkgscripts/codefragments/memmove.h src/
cp $pkgscripts/codefragments/alttio.h src/

ENV= CONFIG_SHELL=/archive/bash2 SHELL=/archive/bash2 /archive/bash2 ./configure --disable-nls
#--disable-locale --disable-shm

#make CFLAGS=
$make 2>&1 | grep -v "has no section"

#leave_source=true

. $pkgscripts/common-end.inc
