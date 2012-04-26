EAPI="3"

MY_S="libg15-${PV}"

DESCRIPTION="This is a library to handle the LCD and extra keys on the Logitech G15 Gaming
Keyboard and similar devices."
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Optional/libg15-${PV}-with-gnome15-enhancements.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="dev-libs/libusb"
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



