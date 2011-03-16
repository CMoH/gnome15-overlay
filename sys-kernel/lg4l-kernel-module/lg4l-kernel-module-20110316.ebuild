EAPI="2"
inherit eutils git linux-mod

DESCRIPTION="Kernel module for Logitech G13, G15, G19 and G110 keyboards"
HOMEPAGE="http://www.gnome15.org/"

# official repo
#EGIT_REPO_URI="git://github.com/martynsmith/lg4l.git"

# my fork
EGIT_REPO_URI="git://github.com/CMoH/lg4l.git"
EGIT_COMMIT="198ad16df5a738798510"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""

# for some reason the build fails with parallel builds
MAKEOPTS=""
#RESTRICT="mirror"

DEPEND=">=virtual/linux-sources-2.6.32"
RDEPEND=""

S="${WORKDIR}"

MODULE_NAMES="hid-g13(extra) hid-g15(extra) hid-g19(extra) hid-g110(extra) hid-gfb(extra)"
#MODULESD_WL_ALIASES=("wlan0 wl")

pkg_setup() {
	# framebuffer
	CONFIG_CHECK="FB FB_DEFERRED_IO"
	CONFIG_CHECK="${CONFIG_CHECK} FB_SYS_FILLRECT FB_SYS_COPYAREA FB_SYS_IMAGEBLIT"
	CONFIG_CHECK="${CONFIG_CHECK} FB_SYS_FOPS FB_HECUBA FB_N411"
	# LCD backlight
	CONFIG_CHECK="${CONFIG_CHECK} BACKLIGHT_LCD_SUPPORT LCD_CLASS_DEVICE"
	CONFIG_CHECK="${CONFIG_CHECK} BACKLIGHT_CLASS_DEVICE"
	# LED support
	CONFIG_CHECK="${CONFIG_CHECK} NEW_LEDS LEDS_CLASS"

	# if kernel_is ge 2 6 33; then
	# 	CONFIG_CHECK="${CONFIG_CHECK} LIB80211 WIRELESS_EXT CFG80211_WEXT WEXT_PRIV ~!MAC80211"
	# 	ERROR_WEXT_PRIV="Starting with 2.6.33, it is not possible to set WEXT_PRIV directly. We recommend to set another symbol selecting WEXT_PRIV, for example, PRISM54, IPW2200 and so on. See Bug #248450 comment#98."
	# elif kernel_is ge 2 6 31; then
	# 	CONFIG_CHECK="${CONFIG_CHECK} LIB80211 WIRELESS_EXT ~!MAC80211"
	# elif kernel_is ge 2 6 29; then
	# 	CONFIG_CHECK="${CONFIG_CHECK} LIB80211 WIRELESS_EXT ~!MAC80211 COMPAT_NET_DEV_OPS"
	# else
	# 	CONFIG_CHECK="${CONFIG_CHECK} IEEE80211 IEEE80211_CRYPT_TKIP"
	# fi
	linux-mod_pkg_setup

	BUILD_PARAMS="-C ${KV_DIR} M=${S}"
	BUILD_TARGETS="hid-g13.ko hid-g15.ko hid-g19.ko hid-g110.ko hid-gfb.ko"
}
