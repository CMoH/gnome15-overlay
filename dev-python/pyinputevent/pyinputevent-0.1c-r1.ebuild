EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Python interface to Linux's input subsystem"
HOMEPAGE="http://www.russo79.com/gnome15"
SRC_URI="https://projects.russo79.com/attachments/download/75/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-python/python-uinput-0.9"
