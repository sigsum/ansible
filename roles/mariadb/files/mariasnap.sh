#! /bin/sh
# Run this script from the BUP_PRE_HOOK in my_bup.sh .
# Removing the snapshot in the BUP_POST_HOOK is a good idea.
set -eu

[ -s /root/.config/mariasnap/vg ]

VG="$(cat /root/.config/mariasnap/vg)"
LV=$VG/db

SNAPNAME=dbsnap
BUPDIR=/var/backups/dbsnap

# The snapshot must be large be enough to fit all the changes to the
# LV from when this script finishes -- that's when the database lock
# is lifted -- until the backup of the snapshot is finished. 100%FREE
# is what's left in the volume group and may or may not be sufficient.
# root@logsrv-02:/var# vgdisplay logsrv-02-nvme | egrep Free
#   Free  PE / Size       24096 / 94.12 GiB

env LVM_SUPPRESS_FD_WARNINGS=1 mariadb <<EOF
flush tables with read lock;
system lvcreate -qq -l 100%FREE --snapshot -n $SNAPNAME $LV;
EOF

[ -d $BUPDIR ] || { mkdir -p $BUPDIR; chmod 700 $BUPDIR; }
mount $VG/$SNAPNAME $BUPDIR
