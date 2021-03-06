################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="uae4arm"
PKG_VERSION="12b6c7f"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/Chips-fr/uae4arm-rpi.git"
PKG_GIT_URL="https://github.com/Chips-fr/uae4arm-rpi.git"
PKG_GIT_BRANCH="master"
PKG_DEPENDS_TARGET="toolchain alsa-lib freetype zlib libX11 SDL SDL_image SDL_ttf SDL_gfx libpng guichan"
PKG_PRIORITY="optional"
PKG_SECTION="emulators"
PKG_SHORTDESC="uae4arm-rpi amiga emulator."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  strip_lto
}

[ "$PROJECT" = "RPi" ] && export CPU_FLAGS="-mcpu=arm1176jzf-s -mfpu=vfp -mfloat-abi=hard"
[ "$PROJECT" = "RPi2" ] && export CPU_FLAGS="-mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard"

make_target() {
  SYSROOT_PREFIX=$SYSROOT_PREFIX CPU_CFLAGS=$TARGET_CFLAGS PLATFORM=gles make
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp $ROOT/$PKG_BUILD/uae4arm $INSTALL/usr/bin
  cp $PKG_DIR/scripts/* $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/config
  cp -R $PKG_DIR/config $INSTALL/usr/config/uae4arm
  cp -R data 		$INSTALL/usr/config/uae4arm/
  ln -s /storage/roms/bios $INSTALL/usr/config/uae4arm/kickstarts
 }
