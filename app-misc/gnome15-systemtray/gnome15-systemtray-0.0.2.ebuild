EAPI="3"
SUPPORT_PYTHON_ABIS="1"

DESCRIPTION="Gnome15 desktop service using a system tray icon."
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Desktop/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="title"

RDEPEND="app-misc/gnome15-core
		 dev-python/dbus-python
		 dev-python/pygobject
title? ( dev-python/setproctitle )"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}

# pkg_postinst() {
# 	python_mod_optimize ${PN}
# }

# pkg_postrm() {
# 	python_mod_cleanup ${PN}
# }


