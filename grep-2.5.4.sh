#!/bin/sh
set -e
set -x

pkgname=grep-2.5.4
tarball=$pkgname.tar.bz2

make=/usr/local/bin/make

. gcc-2.7.2.3.inc
#. gcc-2.95.3.inc
. binutils-2.9.1.inc

. common-start.inc

cat $patches/grep-2.5.4.patch
ls src/grep.c
/usr/local/bin/patch -p2 -i $patches/grep-2.5.4.patch

PATH=/usr/local/bin:$PATH ./configure
#/archive/bash 

. $pkgscripts/common-end.inc
$make
