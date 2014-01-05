Gentoo overlay for Gnome15
==========================

I am a Gentoo user with a Logitech G13 keyboard, and I have created a personal overlay containing ebuilds for the Gnome15 packages. After a while I thought others might benefit from the same set of ebuilds, so here they are.

Since I am only using a limited set of features, I expect others will get into some problems. Please report such problems in the Issues section of the Github project. Contributions are also welcome.



Installing the overlay
======================

You will need to install layman according to the Gentoo Overlay Guide

http://www.gentoo.org/proj/en/overlays/userguide.xml

After having layman installed edit its configuration in /etc/layman/layman.cfg to add this overlay to it's list of known overlays.


    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                https://github.com/niko20010/gnome15-overlay/raw/master/overlay.xml

Next sync layman and add the gnome15 overlay

    layman -S
    layman -a gnome15

For systems following the Gentoo stable branch you'll need to accept the gnome15 package and some of its depdendencies. For convenience, the overlay contains a list of needed packages:

    mkdir -p /etc/portage/package.keywords
    cd /etc/portage/package.keywords
    ln -s /var/lib/layman/gnome15/Documentation/package.keywords/gnome15-stable .

The packages are designed for arches amd64 and x86. If you find they work on other arches as well, please submit an issue.

Using the ebuilds (>=gnome15-0.9.6)
========================================

The ebuild you are interested in is app-misc/gnome15. Upgrades from <gnome15-0.9.6 should work seamlessly, and portage should properly replace virtual/gnome15 with app-misc/gnome15. If not, please report the problems.

The following use-flags affect the installed drivers:

* g15 - installs the userspace g15 drivers, as well as the g15server-daemon replacement
* g19 - installs the userspace g19 drivers
* g930 - installs the userpace g930 drivers
* lg4l-module - installs the kernel driver (g110, g15, g19 and g510)

Other use-flags used by the package are system use-flags, with the following notes:

* evo - enables the evolution calendar plugin
* google - enables the google calendar plugin
* google + cairo - enables the google-analytics plugin
* nexuiz - adds the nexuiz plugins and pulls in games-fps/nexuiz
* voip - enables the voip and the voip-teamspeak3 plugins; it's up to the user to install teamspeak (please report if this setup is convenient)
* weather - enables the weather and the weather-noaa plugins
* weather + yahoo - enables the weather, weather-noaa and weather-yahoo plugins

Note: gnome15-0.9.6 was moved to the unstable branch (~amd64 and ~x86), since portage requires that stable packages should not DEPEND/RDEPEND on unstable packages. Some of the dependencies needed by gnome15 are marked as unstable in the official Gentoo portage tree, thus propagating up to app-misc/gnome15.


Using the ebuilds (<gnome15-0.9.6)
========================================

Before gnome15-0.9.6, the application was split into multiple packages. Those ebuilds will be present on the gnome15-0.9.5 branch, and they will be removed from the master branch shortly.

The core of gnome15 is in the gnome15-core ebuild, while other packages depend on it. You can also install packages by hand, or use the virtual/gnome15 ebuild.

Here are the use-flags and their relevance for virtual/gnome15:

* ayatana - installs gnome15-indicator using libappindicator
* g15 - installs gnome15-sandbox-plugins and g15daemon
* g19 - installs g19d
* gnome - installs gnome15-gnome-plugins and gnome15-panel-applet
* lg4l-module - installs the kernel module (see below)
* pulseaudio - installs gnome15-impulse15
* systray - installs gnome15-systemtray
* themes - installs gnome15-iconpack

Notes: the ayatana use flag is masked by gentoo. Also, there are no packages for the indicator framework, so currently this flag is not properly implemented in my ebuilds either.



Notes on the kernel module
==========================

I am unsure if the necessary modules are auto-loaded by the kernel, so for safety you should add the appropriate `hid-gXX` module to your `/etc/conf.d/modules` as instructed by the Gentoo Handbook.

By default, the kernel has a catch-all hid driver, named generic-usb in kernels before 3.5.0, and lately it seems to be called hid-generic. The `rebind` script from the lg4l-kernel-module ebuild unbinds the default driver and binds the appropriate driver.

The latest version automatically installs the `rebind` script into `/etc/local.d/`. Make sure you have the `local` initscript enabled in your preferred soft runlevel(s).
