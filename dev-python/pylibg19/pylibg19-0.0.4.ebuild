EAPI="3"
PYTHON_MODNAME="g19"

inherit distutils

DESCRIPTION="Python interface to Linux's input subsystem"
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/G19/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

pkg_setup() {
	python_enable_pyc
}
