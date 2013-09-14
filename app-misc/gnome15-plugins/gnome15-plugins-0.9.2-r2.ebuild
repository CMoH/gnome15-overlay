EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit python-r1

DESCRIPTION="Provides a collection of GNOME specific plugins for Gnome15."
HOMEPAGE="http://www.gnome15.org/"
SRC_URI="http://www.gnome15.org/downloads/Gnome15/Optional/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="evo google lm_sensors telepathy v4l"

RDEPEND="app-misc/gnome15-core
		 dev-python/gst-python
		 dev-python/vobject
		 dev-python/gnome-keyring-python
evo? ( dev-python/evolution-python )
google? ( dev-python/gdata )
lm_sensors? ( dev-python/PySensors )
telepathy? ( dev-python/telepathy-python )"
DEPEND="${RDEPEND}"

src_configure() {
	# some files get written in the $HOME directory
	# excerpt from sandbox log:
	# F: mkdir
	# P: /home/cipi/.gstreamer-0.10
	# C: /usr/bin/python2.7 -c import gst

	GST_REGISTRY="${T}/gstreamer-0.10-registry.dat" \
		econf
}
