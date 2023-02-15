#!/bin/sh
set -e
set -x

pkgname=coreutils-5.97
tarball=$pkgname.tar.bz2
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

/usr/local/bin/patch -p4 -i $patches/$pkgname.patch

use_shell=/archive/bash2

chmod +x build-aux/compile

ENV= CONFIG_SHELL=$use_shell SHELL=$use_shell $use_shell ./configure

$make

prefixvar=DESTDIR

. $pkgscripts/common-end.inc
