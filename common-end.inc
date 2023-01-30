
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
if [ ! -d /usr/local ]; then mkdir /usr/local; fi

# check whether we have DESTDIR style and do something appropriate
if [ -d usr/local ]; then
  cp -r usr/local/* /usr/local/
else
  cp -r * /usr/local/
fi
cd ..

if [ -z "$leave_source" ]; then
  rm -rf "$srcdirfull"
fi
rm -rf "$pkgdir"

