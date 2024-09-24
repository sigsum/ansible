#!/bin/bash

#
# A script that downloads a file with some random jitter using curl.
#
# Arguments:
#
#   URL         The resource to download as an HTTP(S) URL.
#   FILENAME    Save the downloaded resource with this filename.
#   MAX_JITTER  Maximum delay before doing the download in seconds.  Set to 60
#               to run within 30s on average.  Set to 0 to disable jitter.
#
# Usage:
#
#   download-file.sh URL FILENAME MAX_JITTER
#

set -eu
trap clean_up EXIT

URL=$1; shift
FILENAME=$1; shift
MAX_JITTER=$1; shift

function die() {
	echo "Error: $*" >&2
	exit 1
}

function clean_up() {
	rm -f "$FILENAME".tmp
}

jitter=$((RANDOM % (MAX_JITTER + 1)))
sleep $jitter

status_code=$(curl -so "$FILENAME.tmp" -w '%{http_code}' "$URL")
[[ "$status_code" == 200 ]] || die "Failed to retrieve $URL (HTTP status code: $status_code)"
mv "$FILENAME".tmp "$FILENAME"
