#! /bin/sh
set -eu

# Run this script before taking an offline backup and make sure that
# the offline backup includes $BUPDIR (set below).
# Run the accompanying mariarmsnap.sh script after taking the offline
# backup.

# Configuration and setup:
# ~/.config/mariasnap/lv contains one line with the name of the
#                        LV where the database lives, on the form VG/LV.
# Example: echo vg-sigsum-log-02-db/db > /root/.config/mariasnap/lv

[ -s ~/.config/mariasnap/lv ]	# Ensure non-empty file.
LV="$(cat ~/.config/mariasnap/lv)"
VG="$(dirname "$LV")"

SNAPNAME=dbsnap
BUPDIR=/var/backups/dbsnap

# NOTE: The snapshot must be large be enough to fit all the changes to
# the LV from when this script finishes -- that's when the database
# lock is lifted -- until the backup of the snapshot is finished.
# 100%FREE in the lvcreate command below is what's left in the volume
# group and may or may not be sufficient.
# Investigate using the vgdisplay command:
#     vgdisplay my-vg | egrep Free
#       Free  PE / Size       24096 / 94.12 GiB

env LVM_SUPPRESS_FD_WARNINGS=1 mariadb <<EOF
flush tables with read lock;
system lvcreate -qq -l 100%FREE --snapshot -n "$SNAPNAME" "$LV";
EOF

[ -d "$BUPDIR" ] || { mkdir -p "$BUPDIR"; chmod 700 "$BUPDIR"; }
mount -o ro /dev/"$VG"/"$SNAPNAME" "$BUPDIR"
