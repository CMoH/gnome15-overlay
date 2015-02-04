EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Python interface to Linux's input subsystem"
HOMEPAGE="http://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="http://www.cheepee.ro/~cipi/portage/distfiles/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-python/python-uinput-0.9"
