EAPI="3"
SUPPORT_PYTHON_ABIS="1"

inherit distutils

DESCRIPTION="Python API to the Linux uinput-system."
HOMEPAGE="http://codegrove.org/projects/python-uinput/"
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND="dev-libs/libsuinput"
DEPEND="${RDEPEND}"

RESTRICT_PYTHON_ABIS="3.*"
