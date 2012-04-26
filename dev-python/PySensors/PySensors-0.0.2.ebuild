EAPI="3"
PYTHON_MODULE="sensors"

inherit distutils

DESCRIPTION="Python bindings for libsensors.so from the lm-sensors project"
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Optional/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE=""

RDEPEND="sys-apps/lm_sensors"
DEPEND="${RDEPEND}"

pkg_setup() {
	python_enable_pyc
}
