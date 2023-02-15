#!/bin/sh
set -e
set -x

pkgname=tcl8.6.13
tarball=$pkgname-src.tar.gz
make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc
PATH=/usr/local/bin:$PATH
export PATH

. common-start.inc

#/usr/local/bin/patch -p1 -i $patches/$pkgname.patch

use_shell=/archive/bash2

cd unix

ENV= CONFIG_SHELL=$use_shell SHELL=$use_shell $use_shell ./configure

$make

prefixvar=DESTDIR

. $pkgscripts/common-end.inc
