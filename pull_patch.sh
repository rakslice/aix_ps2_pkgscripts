#!/bin/sh
set -e
set -x

[ $# -ge 1 ] || exit 1

pkgname=$1
shift

stock=/nfs/stock/$pkgname
src=/u/root/src/$pkgname

[ -d $stock ] || exit 1
[ -d $src ] || exit 1

/usr/local/bin/diff -ur "$@" $stock $src | grep -v '^Only in ' | tee /tmp/$pkgname.patch
cp /tmp/$pkgname.patch patches/$pkgname.patch

