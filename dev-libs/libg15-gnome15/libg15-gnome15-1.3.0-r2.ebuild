EAPI="3"

MY_S="libg15-${PV}"

DESCRIPTION="Library to handle the LCD and extra keys on the Logitech G15 Gaming Keyboard and similar devices."
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Optional/libg15-${PV}-with-gnome15-enhancements.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="virtual/libusb"
DEPEND="${RDEPEND}"

src_configure() {
	cd ${MY_S} && econf || die "econf failed"
}

src_compile() {
	cd ${MY_S} && emake || die "emake failed"
}

src_install() {
	cd ${MY_S} && emake DESTDIR="${D}" install || die "emake install failed"
}
