
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
cp -r * /usr/local
cd ..

rm -rf "$srcdirfull"
rm -rf "$pkgdir"

