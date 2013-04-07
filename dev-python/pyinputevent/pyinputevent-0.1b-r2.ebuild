EAPI="3"
PYTHON_DEPEND="2"

inherit distutils

DESCRIPTION="Python interface to Linux's input subsystem"
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Optional/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-python/python-uinput-0.9"

pkg_setup() {
	python_set_active_version 2
}
