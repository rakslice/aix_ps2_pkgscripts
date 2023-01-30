
if [ "$prefixvar" = "" ]; then
	prefixvar="prefix"
fi

if [ "$installtargets" = "" ]; then
	installtargets="install"
fi

if [ ! -d "$pkgdir" ]; then
  mkdir "$pkgdir"
fi
"$make" $installtargets $prefixvar="$pkgdir" $make_install_args

tar cf "$pkgdir.pkg" "$pkgdir"

cd "$pkgdir"

if [ -z "$pkgprefix" ]; then
	pkgprefix=/usr/local
fi
if [ ! -d $pkgprefix ]; then mkdir $pkgprefix; fi

# check whether we have DESTDIR style and do something appropriate
[ "`echo "$pkgprefix" | cut -c1`" = "/" ] || exit 1
pkgprefixrel="`echo "$pkgprefix" | cut -c2-`"
if [ -d $pkgprefixrel ]; then
  cp -r $pkgprefixrel/* $pkgprefix
else
  cp -r * $pkgprefix
fi
cd ..

if [ -z "$leave_source" ]; then
  rm -rf "$srcdirfull"
fi
rm -rf "$pkgdir"

