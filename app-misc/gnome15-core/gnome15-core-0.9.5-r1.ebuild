EAPI=5

PYTHON_COMPAT=( python{2_6,2_7} )

inherit eutils linux-info python-r1

MY_PN="gnome15"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Gnome tools for the Logitech G Series Keyboards And Z-10 Speakers"
HOMEPAGE="http://www.russo79.com/gnome15"
SRC_URI="https://projects.russo79.com/attachments/download/129/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="ayatana cairo g15 g19 gnome lg4l-module systray themes title webkit"

IUSE_GNOME15_PLUGINS=""

RDEPEND="dev-python/pygtk
		 dev-python/gconf-python
		 dev-python/dbus-python
		 dev-python/libgtop-python
		 dev-python/lxml
		 dev-python/pycairo
		 dev-python/imaging
		 dev-python/python-xlib
		 dev-python/librsvg-python
		 dev-python/pyalsa
		 dev-python/pyalsaaudio
		 dev-python/feedparser
		 dev-python/pyinotify
		 dev-python/libwnck-python
		 dev-python/pyusb
		 dev-python/pyxdg
		 dev-python/python-uinput
		 dev-python/python-virtkey
		 dev-python/pyinputevent
		 virtual/udev
		 dev-python/keyring
		 x11-themes/gnome-icon-theme
cairo? ( x11-misc/cairo-clock
		 dev-python/cairoplot-gnome15 )
g15?   ( dev-libs/libg15-gnome15 )
g19?   ( dev-python/pylibg19 )
gnome? ( gnome-base/libgnomeui
		 dev-python/gnome-desktop-python
		 dev-python/gnome-applets-python
		 dev-python/pygobject )
lg4l-module? ( >=sys-kernel/lg4l-kernel-module-20130307 )
systray? ( dev-python/pygobject )
themes? ( =app-misc/gnome15-iconpack-0.0.6 )
title? ( dev-python/setproctitle )"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${MY_P}"

pkg_setup() {
	ERROR_INPUT_UINPUT="INPUT_UINPUT is required for g15-desktop-service to work"
	CONFIG_CHECK="~INPUT_UINPUT"
	check_extra_config

	python_set_active_version 2
	python_pkg_setup
}

src_configure() {
	GST_REGISTRY="${T}/gstreamer-registry" \
		econf \
		$(use_enable ayatana indicator) \
		$(use_enable gnome applet) \
		$(use_enable systray systemtray) \
		--enable-udev=/etc/udev/rules.d
}
