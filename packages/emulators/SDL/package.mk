################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="SDL"
PKG_VERSION="5e5cf17"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/vanfanel/SDL-1.2.15-raspberrypi.git"
PKG_GIT_URL="https://github.com/vanfanel/SDL-1.2.15-raspberrypi.git"
PKG_GIT_BRANCH="master"
PKG_DEPENDS_TARGET="toolchain yasm:host alsa-lib"
PKG_PRIORITY="optional"
PKG_SECTION="emulators"
PKG_SHORTDESC="libsdl: A cross-platform Graphic API"
PKG_LONGDESC="Simple DirectMedia Layer is a cross-platform multimedia library designed to provide fast access to the graphics framebuffer and audio device. It is used by MPEG playback software, emulators, and many popular games, including the award winning Linux port of 'Civilization: Call To Power.' Simple DirectMedia Layer supports Linux, Win32, BeOS, MacOS, Solaris, IRIX, and FreeBSD."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_HOST="--disable-video-opengl --enable-video-dispmanx --disable-video-directfb --disable-cdrom --disable-oss --disable-alsatest --disable-pulseaudio --disable-pulseaudio-shared --disable-arts --disable-nas --disable-esd --disable-nas-shared --disable-diskaudio --disable-dummyaudio --disable-mintaudio --disable-video-x11 --disable-input-tslib" 
PKG_CONFIGURE_OPTS_TARGET="X_CFLAGS= SYSROOT_PREFIX=$SYSROOT_PREFIX --disable-video-opengl --enable-video-dispmanx --disable-video-directfb --disable-cdrom --disable-oss --disable-alsatest --disable-pulseaudio --disable-pulseaudio-shared --disable-arts --disable-nas --disable-esd --disable-nas-shared --disable-diskaudio --disable-dummyaudio --disable-mintaudio --disable-video-x11 --disable-input-tslib" 

post_makeinstall_target() {
  mkdir -p $ROOT/$TOOLCHAIN/bin
    cp $SYSROOT_PREFIX/usr/bin/sdl-config $ROOT/$TOOLCHAIN/bin
    $SED "s:\(['=\" ]\)/usr:\\1$SYSROOT_PREFIX/usr:g" $SYSROOT_PREFIX/usr/bin/sdl-config

  rm -rf $INSTALL/usr/bin
}
