EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1

DESCRIPTION="Python API to the Linux uinput-system."
HOMEPAGE="http://codegrove.org/projects/python-uinput/"
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-libs/libsuinput"
DEPEND="${RDEPEND}"
