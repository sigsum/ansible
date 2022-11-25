#! /bin/sh
set -eu

# Run this script from the BUP_POST_HOOK in my_bup.sh, after
# mariasnap.sh has been run from the BUP_PRE_HOOK.

[ -s /root/.config/mariasnap/vg ]

VG="$(cat /root/.config/mariasnap/vg)"
SNAPNAME=dbsnap
BUPDIR=/var/backups/dbsnap

umount $BUPDIR
lvremove -qq -y $VG/$SNAPNAME
