#! /bin/sh

# Run this script after the offline backup has been made, when
# mariasnap.sh has been run before that.

set -eu
[ -s /root/.config/mariasnap/vg ]

VG="$(cat /root/.config/mariasnap/vg)"
VG=${VG#/dev/}
SNAPNAME=dbsnap
BUPDIR=/var/backups/dbsnap

umount $BUPDIR || true          # Don't exit on failure
lvremove -qq -y "$VG"/$SNAPNAME
