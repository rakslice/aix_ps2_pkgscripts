
if [ "$prefixvar" = "" ]; then
	prefixvar="prefix"
fi

if [ ! -d "$pkgdir" ]; then
  mkdir "$pkgdir"
fi
"$make" install $prefixvar="$pkgdir" $make_install_args

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

rm -rf "$srcdirfull"
rm -rf "$pkgdir"

