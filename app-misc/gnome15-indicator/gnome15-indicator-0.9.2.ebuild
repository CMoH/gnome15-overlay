EAPI=3

inherit python

DESCRIPTION="Panel indicator that can be used to control and monitor the Gnome15 desktop service"
HOMEPAGE="http://www.russo79.com/gnome15"
SRC_URI="https://projects.russo79.com/attachments/download/124/gnome15-indicator-0.9.2.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="app-misc/gnome15-core"
RDEPEND="${DEPEND}"

PYTHON_DEPEND="2:2.6"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
