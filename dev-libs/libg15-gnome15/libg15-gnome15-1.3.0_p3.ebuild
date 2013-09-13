EAPI="3"

MY_PV="${PV%_p*}"
MY_PV_P="${PV#${MY_PV}_p}"

DESCRIPTION="Library to handle the LCD and extra keys on the Logitech G15 Gaming Keyboard and similar devices."
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Optional/libg15-${MY_PV}-with-gnome15-enhancements-${MY_PV_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="dev-libs/libusb"
DEPEND="${RDEPEND}"

S="libg15-${MY_PV}"

# src_configure() {
# 	cd ${MY_S} && econf || die "econf failed"
# }

# src_compile() {
# 	cd ${MY_S} && emake || die "emake failed"
# }

# src_install() {
# 	cd ${MY_S} && emake DESTDIR="${D}" install || die "emake install failed"
# }
