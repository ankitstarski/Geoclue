#!/bin/sh

set -e # exit on errors

REQUIRED_AUTOMAKE_VERSION=1.9

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.
mkdir -p m4
PKG_NAME=GeoClue

git submodule update --init --recursive
gtkdocize
autoreconf -v --force --install
intltoolize -f

if [ -z "$NOCONFIGURE" ]; then
    "$srcdir"/configure --enable-maintainer-mode --enable-debug ${1+"$@"}
fi
