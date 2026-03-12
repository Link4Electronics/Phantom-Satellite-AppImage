#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
#pacman -Syu --noconfirm

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
make-aur-package openssl-1.1
make-aur-package python2
make-aur-package gtk2
make-aur-package

# If the application needs to be manually built that has to be done down here
mkdir -p ./AppDir/bin
mv -v /usr/lib/phantomsatellite/* ./AppDir/bin
