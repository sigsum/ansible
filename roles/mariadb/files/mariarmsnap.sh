#! /bin/sh
set -eu

# Run this script after the offline backup has been made, when
# mariasnap.sh has been run before that.

# Configuration and setup:
# ~/.config/mariasnap/lv contains one line with the name of the
#                        LV where the database lives, on the form VG/LV.
# Example: echo vg-sigsum-log-02-db/db > /root/.config/mariasnap/lv

[ -s ~/.config/mariasnap/lv ]	# Ensure non-empty file.
LV="$(cat ~/.config/mariasnap/lv)"
VG="$(dirname "$LV")"

SNAPNAME=dbsnap
BUPDIR=/var/backups/dbsnap

umount "$BUPDIR" || true	# Don't exit on failure
lvremove -qq -y "$VG"/"$SNAPNAME"
