# Maintainer: Najeeb Rifaat <mohamme89d@gmail.com>

pkgname=dwm-najeeb
basepkgname=dwm
pkgver=6.2
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'st-najeeb' 'dmenu-najeeb' 'i3lock')
provides=("${pkgname}")
conflicts=("${basepkgname}")
install=dwm.install

_patches=(
  "colors-wal-dwm.6.2.h"
  "https://dwm.suckless.org/patches/activetagindicatorbar/dwm-activetagindicatorbar-6.2.diff"
  "https://dwm.suckless.org/patches/fullgaps/dwm-fullgaps-6.2.diff"
  "https://dwm.suckless.org/patches/moveresize/dwm-moveresize-20160731-56a31dc.diff"
  "https://dwm.suckless.org/patches/pertag/dwm-pertag-20170513-ceac8c9.diff"
  "dwm.c"
)
source=(
  "http://dl.suckless.org/dwm/$basepkgname-$pkgver.tar.gz"
  "${_patches[@]}"
  "config.h"
	"dwm.desktop"
	"sleeplock.service"
)

md5sums=('SKIP')

prepare() {
  cd $srcdir/$basepkgname-$pkgver
}
#patch -Np1 -F4 -i "$srcdir/dwm-6.1-xkb.diff"

build() {
  cd $srcdir/colors-wal-dwm.6.2.h ~/
  cd $srcdir/$basepkgname-$pkgver
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dwm-moveresize-20160731-56a31dc.diff"
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dwm-activetagindicatorbar-6.2.diff"
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dwm-fullgaps-6.2.diff"
  patch -Np1 -F3 --ignore-whitespace < "$srcdir/dwm-pertag-20170513-ceac8c9.diff"

  cp $srcdir/config.h config.h
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd $srcdir/$basepkgname-$pkgver
  make PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$basepkgname/LICENSE
  install -m644 -D README $pkgdir/usr/share/doc/$basepkgname/README
  install -m644 -D $srcdir/dwm.desktop $pkgdir/usr/share/xsessions/dwm.desktop
}
