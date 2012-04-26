EAPI="3"

DESCRIPTION="Provides a collection of GNOME specific plugins for Gnome15."
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Optional/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="evo lm_sensors telepathy v4l"

RDEPEND="app-misc/gnome15-core
		 dev-python/vobject
		 dev-python/gnome-keyring-python
		!app-misc/gnome15-gnome-plugins
evo?   ( dev-python/evolution-python )
lm_sensors? ( dev-python/PySensors )
telepathy? ( dev-python/telepathy-python )"

DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
