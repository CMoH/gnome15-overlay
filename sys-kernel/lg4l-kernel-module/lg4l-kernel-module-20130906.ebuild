EAPI="2"
inherit eutils git linux-mod

DESCRIPTION="Kernel module for Logitech G13, G15, G19 and G110 keyboards"
HOMEPAGE="http://www.russo79.com/gnome15"

# official repo
#EGIT_REPO_URI="git://github.com/martynsmith/lg4l.git"

# my fork
EGIT_REPO_URI="git://github.com/CMoH/lg4l.git"
EGIT_COMMIT="8493eddff69f7a84bcbb0c69c66eceab8474177e"

LICENSE="GPL-2"
KEYWORDS="amd64 x86"
IUSE=""

# for some reason the build fails with parallel builds
MAKEOPTS=""
#RESTRICT="mirror"

DEPEND="virtual/linux-sources"
RDEPEND=""

S="${WORKDIR}"

MODULE_NAMES="hid-g13(extra) hid-g15(extra) hid-g19(extra) hid-g110(extra) hid-gfb(extra) hid-ginput(extra)"

pkg_setup() {
	if kernel_is lt 3 10 7; then
		echo
		ewarn "Your kernel version is ${KV_MAJOR}.${KV_MINOR}.${KV_PATCH}"
		ewarn "This module works with a kernel version >= 3.10.7"
		echo
		ewarn "DO NOT file bug reports for lesser kernel versions as they will be ignored."
	fi

	# framebuffer
	CONFIG_CHECK="FB FB_DEFERRED_IO"
	CONFIG_CHECK="${CONFIG_CHECK} FB_SYS_FILLRECT FB_SYS_COPYAREA FB_SYS_IMAGEBLIT"
	CONFIG_CHECK="${CONFIG_CHECK} FB_SYS_FOPS FB_HECUBA FB_N411"
	# LCD backlight
	CONFIG_CHECK="${CONFIG_CHECK} BACKLIGHT_LCD_SUPPORT LCD_CLASS_DEVICE"
	CONFIG_CHECK="${CONFIG_CHECK} BACKLIGHT_CLASS_DEVICE"
	# LED support
	CONFIG_CHECK="${CONFIG_CHECK} NEW_LEDS LEDS_CLASS"

	linux-mod_pkg_setup

	BUILD_PARAMS="-C ${KV_DIR} M=${S}"
	BUILD_TARGETS=" " # let the default target build the modules
#	BUILD_TARGETS="hid-g13.ko hid-g15.ko hid-g19.ko hid-g110.ko hid-gfb.ko"
}

src_install() {
	linux-mod_src_install

	ebegin
	einfo "Installing lg4l rebind script as /etc/local.d/lg4l-rebind.start"
	einfo
	einfo "Please check if your existing method for rebinding the lg4l drivers at boot time"
	einfo "is still required/in conflict/better than the one supplied by this ebuild"
	eend

	exeinto /etc/local.d
	newexe rebind lg4l-rebind.start
}
