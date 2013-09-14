EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit python-r1

DESCRIPTION="Panel indicator that can be used to control and monitor the Gnome15 desktop service"
HOMEPAGE="http://www.russo79.com/gnome15"
SRC_URI="https://projects.russo79.com/attachments/download/124/gnome15-indicator-0.9.2.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="app-misc/gnome15-core"
RDEPEND="${DEPEND}"
