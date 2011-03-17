EAPI="3"

DESCRIPTION="A tool for the LED lights on Logitech G13, G15 and G19 keyboards"
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Optional/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"


src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}


