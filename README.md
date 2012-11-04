NOTE: this overlay is work in progress. Don't expect it to work seamlessly; if you find it to be useful use it. If not, improve it :)

Gentoo overlay for Gnome15
==========================

I am a Gentoo user with a Logitech G19 keyboard, and from the desire to be a user of gnome15, a nice userspace controller for the keyboard, I have created a personal overlay containing ebuilds for these packages.

After a while I thought others might benefit from the same set of ebuilds, so here they are.

NOTE: I published this repository and I am using it according to my own needs. While I have tried to keep all ebuilds correct, I do not guarantee the ebuilds will work correctly for configurations I do not personally use. 



Installing the overlay
======================

You will need to install layman according to the Gentoo Overlay Guide

http://www.gentoo.org/proj/en/overlays/userguide.xml

After having layman installed edit its configuration in /etc/layman/layman.cfg to add this overlay to it's list of known overlays.


    overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
                https://github.com/CMoH/gnome15-overlay/raw/master/overlay.xml

Next sync layman and add the gnome15 overlay

    layman -S
    layman -a gnome15

Some of the packages needed by Gnome15 are marked as unstable at the moment, so you'll need to accept them if, like me, you have chosen a stable systems:

    mkdir -p /etc/portage/package.keywords
    cd /etc/portage/package.keywords
    ln -s /var/lib/layman/gnome15/Documentation/package.keywords/gnome15-deps .


Using the ebuilds
=================

The core of gnome15 is in the gnome15-core ebuild, while other packages depend on it. You can also install packages by hand, or use the virtual/gnome15 ebuild.

Here are the use-flags and their relevance for virtual/gnome15:

* ayatana - installs gnome15-indicator using libappindicator
* g15d - installs gnome15-sandbox-plugins and g15daemon
* g19d - installs g19d
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


The -9999 ebuilds
=======================

The ebuilds are for development use and currently they point to my branch of the gnome15 project. Within them you will find the URL towards the official Gnome15 bazaar branch - feel free to replace the URI and use them with the official branch or your own.

These ebuilds refer to the fresh code on the bazaar repository, not to released versions. Therefore all are marked as unstable.

To enable these on stable systems, add gnome15-9999 to package.keywords:

    mkdir -p /etc/portage/package.keywords
    cd /etc/portage/package.keywords
    ln -s /var/lib/layman/gnome15/Documentation/package.keywords/gnome15-9999 .


