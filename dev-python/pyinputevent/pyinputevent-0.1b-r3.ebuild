EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )
PYTHON_DEPEND="2"

inherit distutils-r1

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
