EAPI="3"
SUPPORT_PYTHON_ABIS="1"

MY_PN="gnome15"
MY_P="${MY_PN}-${PV}"
MY_S="${WORKDIR}/${MY_P}"

DESCRIPTION="Gnome tools for the Logitech G Series Keyboards And Z-10 Speakers"
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Required/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="cairo lg4l-module title"

RDEPEND="dev-python/pygtk
		 dev-python/gconf-python
		 dev-python/dbus-python
		 dev-python/lxml
		 dev-python/pycairo
		 dev-python/imaging
		 dev-python/python-xlib
		 dev-python/librsvg-python
		 dev-python/pyalsa
		 dev-python/pyalsaaudio
		 dev-python/feedparser
		 dev-python/pyinotify
		 dev-python/libwnck-python
cairo? ( x11-misc/cairo-clock )
lg4l-module? ( dev-python/pyinputevent
			   app-misc/lgsetled )
title? ( dev-python/setproctitle )"
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

# pkg_postinst() {
# 	python_mod_optimize ${MY_PN}
# }

# pkg_postrm() {
# 	python_mod_cleanup ${MY_PN}
# }

