EAPI=5

inherit eutils linux-info python

DESCRIPTION="Gnome tools for the Logitech G Series Keyboards And Z-10 Speakers"
HOMEPAGE="http://www.russo79.com/gnome15"
SRC_URI="https://projects.russo79.com/attachments/download/140/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="alsa ayatana debug cairo evo g15 g19 g930 gnome google gstreamer
	  imap lg4l-module lm_sensors pop pulseaudio networkmanager nexuiz
	  rss screensaver systray telepathy themes title voip weather
	  webkit xrandr yahoo"

OBSOLETE_PACKAGES="\
	!dev-libs/libg15-gnome15
	!dev-python/pylibg19
	!app-misc/gnome15-core
	!app-misc/gnome15-iconpack
	!app-misc/gnome15-impulse15
	!app-misc/gnome15-plugins"

RDEPEND="${OBSOLETE_PACKAGES} \
			   dev-python/pygtk
			   dev-python/gconf-python
			   dev-python/dbus-python
			   dev-python/libgtop-python
			   dev-python/lxml
			   dev-python/imaging
			   dev-python/python-xlib
			   dev-python/librsvg-python
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
alsa?        ( dev-python/pyalsa
			   dev-python/pyalsaaudio )
cairo?       ( x11-misc/cairo-clock
			   dev-python/pycairo
			   dev-python/cairoplot-gnome15 )
evo?         ( dev-python/evolution-python
			   dev-python/vobject )
gnome?       ( gnome-base/libgnomeui
			   dev-python/gnome-applets-python
			   dev-python/gnome-desktop-python
			   dev-python/gnome-keyring-python
			   dev-python/pygobject )
g15?         ( !app-misc/g15daemon )
google?      ( dev-python/gdata )
gstreamer?   ( dev-python/gst-python )
lg4l-module? ( sys-kernel/lg4l-kernel-module )
lm_sensors?  ( dev-python/PySensors )
nexuiz?      ( games-fps/nexuiz )
pulseaudio?  ( sci-libs/fftw:3.0
			   media-sound/pulseaudio )
rss?         ( dev-python/feedparser )
systray?     ( dev-python/pygobject )
telepathy?   ( dev-python/telepathy-python )
title?       ( dev-python/setproctitle )
"
DEPEND="${RDEPEND}"
PYTHON_DEPEND="2:2.6"

pkg_setup() {
	ERROR_INPUT_UINPUT="INPUT_UINPUT is required for g15-desktop-service to work"
	CONFIG_CHECK="~INPUT_UINPUT"
	check_extra_config

	python_set_active_version 2
	python_pkg_setup
}

src_configure() {
	local DRIVERS
	local PLUGINS
	local THEMES

### if you have suggestions or problems using Gnome15 via these ebuilds,
### post them at https://github.com/CMoH/gnome15-overlay

	DRIVERS="\
		$(use_enable lg4l-module driver-kernel) \
		$(use_enable g15         driver-g15) \
		$(use_enable g19         driver-g19direct) \
		$(use_enable g930        driver-g930) \
	"

	PLUGINS="\
		--enable-plugin-background \
		--enable-plugin-backlight \
		--enable-plugin-clock \
		--enable-plugin-fx \
		--enable-plugin-lcdshot \
		--enable-plugin-macro_recorder \
		--enable-plugin-macros \
		--enable-plugin-menu \
		--enable-plugin-mounts \
		--enable-plugin-mpris \
		--enable-plugin-panel \
		--enable-plugin-processes \
		--enable-plugin-profiles \
		--enable-plugin-stopwatch \
		--enable-plugin-sysmon \
		--enable-plugin-trafficstats \
		--enable-plugin-tails \
		--enable-plugin-things \
		--enable-plugin-tweak \
		$(use_enable alsa           plugin-volume) \
		$(use_enable ayatana        plugin-indicator-messages) \
		$(use_enable debug          plugin-debug) \
		$(use_enable cairo          plugin-cairo-clock) \
		$(use_enable evo            plugin-cal-evolution) \
		$(use_enable gstreamer      plugin-mediaplayer) \
		$(use_enable g15            plugin-g15daemon-server) \
		$(use_enable google         plugin-cal-google) \
		$(use_enable gstreamer      plugin-mediaplayer) \
		$(use_enable lm_sensors     plugin-sense) \
		$(use_enable pulseaudio     plugin-impulse15) \
		$(use_enable networkmanager plugin-nm) \
		$(use_enable rss            plugin-rss) \
		$(use_enable screensaver    plugin-screensaver) \
		$(use_enable telepathy      plugin-im) \
		$(use_enable voip           plugin-voip) \
		$(use_enable weather        plugin-weather) \
		$(use_enable webkit         plugin-webkit-browser) \
		$(use_enable xrandr         plugin-display) \
	"

	# calendar plugins
	if use evo || use google ; then
		PLUGINS="${PLUGINS} --enable-plugin-cal"
	fi

	if use cairo && use google ; then
		PLUGINS="${PLUGINS} --enable-plugin-google-analytics"
	fi

	if use pop || use imap ; then
		PLUGINS="${PLUGINS} --enable-plugin-lcdbiff"
	fi

	if use voip ; then
		PLUGINS="${PLUGINS} --enable-plugin-voip-teamspeak3"
	fi

	if use weather ; then
		PLUGINS="${PLUGINS} --enable-plugin-weather-noaa"
		if use yahoo ; then
			PLUGINS="${PLUGINS} --enable-plugin-weather-yahoo"
		fi
	fi

#### not sure how to expose these plugins:
  # --enable-plugin-lens    Enable Unity Lens plugin.
  # --enable-plugin-notify-lcd
  #                         Enable Notify LCD plugin. Takes over as notification
  #                         daemon and displays messages on LCD, blinks keyboard
  # --enable-plugin-notify-lcd2
  #                         Enable Notify LCD plugin. Takes over as notification
  #                         daemon and displays messages on LCD, blinks keyboard
  # --enable-plugin-ppastats
  #                         Enable PPAStats plugin.
###########################################

	THEMES="\
		--enable-icons-mono \
		$(use_enable themes  icons-awoken) \
	"

	# finally, the config
	GST_REGISTRY="${T}/gstreamer-registry" \
		econf \
		$(use_enable ayatana indicator) \
		$(use_enable systray systemtray) \
		$(use_enable gnome   gnome-shell-extension) \
		${DRIVERS} \
		${PLUGINS} \
		${THEMES}
}
